import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

import 'generated/l10n.dart';
import 'repositories/ehentai_client.dart';
import 'screens/check_update/screen.dart';
import 'screens/gallery/screen.dart';
import 'screens/home/screen.dart';
import 'screens/login/screen.dart';
import 'screens/search/screen.dart';
import 'screens/setting/screen.dart';
import 'screens/view/screen.dart';
import 'stores/download.dart';
import 'stores/favorite.dart';
import 'stores/gallery.dart';
import 'stores/image.dart';
import 'stores/session.dart';
import 'stores/setting.dart';
import 'tables/database.dart';
import 'tasks/handler.dart';
import 'utils/firebase.dart';

void callbackDispatcher() {
  Workmanager.executeTask((taskName, inputData) {
    return backgroundTaskHandler(taskName, inputData);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  Workmanager.initialize(callbackDispatcher);

  runZonedGuarded(() {
    runApp(const MainApp());
  }, Crashlytics.instance.recordError);
}

class MainApp extends StatefulWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  static const _accentColor = Colors.deepOrangeAccent;
  static final _sliderTheme = SliderThemeData.fromPrimaryColors(
    primaryColor: _accentColor,
    primaryColorDark: _accentColor,
    primaryColorLight: _accentColor,
    valueIndicatorTextStyle: const TextStyle(),
  );
  static final _themeData = <ThemeSetting, ThemeData>{
    ThemeSetting.light: ThemeData(
      primarySwatch: Colors.brown,
      accentColor: _accentColor,
      brightness: Brightness.light,
      sliderTheme: _sliderTheme,
    ),
    ThemeSetting.dark: ThemeData(
      accentColor: _accentColor,
      toggleableActiveColor: _accentColor,
      brightness: Brightness.dark,
      sliderTheme: _sliderTheme,
    ),
    ThemeSetting.black: ThemeData(
      accentColor: _accentColor,
      toggleableActiveColor: _accentColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      dividerColor: Colors.grey[800],
      sliderTheme: _sliderTheme,
    ),
  };

  Database _database;
  Brightness _platformBrightness;
  SessionStore _sessionStore;
  EHentaiClient _eHentaiClient;
  GalleryStore _galleryStore;
  ImageStore _imageStore;
  SettingStore _settingStore;
  FavoriteStore _favoriteStore;
  DownloadStore _downloadStore;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _updatePlatformBrightness();
    _database = Database();
    _sessionStore = SessionStore(
      secureStorage: const FlutterSecureStorage(),
    );
    _eHentaiClient = EHentaiClient(
      httpClient: http.Client(),
      sessionStore: _sessionStore,
    );
    _galleryStore = GalleryStore(
      client: _eHentaiClient,
      galleriesDao: _database.galleriesDao,
    );
    _imageStore = ImageStore(client: _eHentaiClient);
    _settingStore = SettingStore();
    _favoriteStore = FavoriteStore(
      client: _eHentaiClient,
      galleryStore: _galleryStore,
    );
    _downloadStore = DownloadStore(
      downloadTasksDao: _database.downloadTasksDao,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    setState(() {
      _updatePlatformBrightness();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _database),
        Provider.value(value: _sessionStore),
        Provider.value(value: _eHentaiClient),
        Provider.value(value: _settingStore),
        Provider.value(value: _galleryStore),
        Provider.value(value: _imageStore),
        Provider.value(value: _favoriteStore),
        Provider.value(value: _downloadStore),
      ],
      child: _buildApp(),
    );
  }

  void _updatePlatformBrightness() {
    _platformBrightness = WidgetsBinding.instance.window.platformBrightness;
  }

  Widget _buildApp() {
    return Observer(
      builder: (context) {
        if (_settingStore.theme.status == FutureStatus.pending) {
          return Container();
        }

        return MaterialApp(
          title: 'EH Redux',
          theme:
              _getThemeData(_settingStore.theme.value ?? ThemeSetting.system),
          navigatorObservers: [
            firebaseAnalyticsObserver,
          ],
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName: (_) => const HomeScreen(),
            GalleryScreen.routeName: (_) => const GalleryScreen(),
            ViewScreen.routeName: (_) => const ViewScreen(),
            SearchScreen.routeName: (_) => const SearchScreen(),
            LoginScreen.routeName: (_) => const LoginScreen(),
            SettingScreen.routeName: (_) => const SettingScreen(),
            CheckUpdateScreen.routeName: (_) => const CheckUpdateScreen(),
          },
        );
      },
    );
  }

  ThemeData _getThemeData(ThemeSetting setting) {
    ThemeSetting key;

    if (setting == ThemeSetting.system) {
      if (_platformBrightness == Brightness.dark) {
        key = ThemeSetting.dark;
      } else {
        key = ThemeSetting.light;
      }
    } else {
      key = setting;
    }

    return _themeData[key];
  }
}
