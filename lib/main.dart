import 'dart:async';

import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/screens/check_update/screen.dart';
import 'package:eh_redux/screens/gallery/screen.dart';
import 'package:eh_redux/screens/home/screen.dart';
import 'package:eh_redux/screens/login/screen.dart';
import 'package:eh_redux/screens/search/screen.dart';
import 'package:eh_redux/screens/setting/screen.dart';
import 'package:eh_redux/screens/view/screen.dart';
import 'package:eh_redux/stores/favorite.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/stores/setting.dart';
import 'package:eh_redux/tables/database.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

void main() {
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

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
    _galleryStore = GalleryStore(client: _eHentaiClient);
    _imageStore = ImageStore(client: _eHentaiClient);
    _settingStore = SettingStore();
    _favoriteStore = FavoriteStore(
      client: _eHentaiClient,
      galleryStore: _galleryStore,
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
        Provider(
          create: (_) => _database,
        ),
        Provider(
          create: (_) => _sessionStore,
        ),
        Provider(
          create: (_) => _eHentaiClient,
        ),
        Provider(
          create: (_) => _settingStore,
        ),
        Provider(
          create: (_) => _galleryStore,
        ),
        Provider(
          create: (_) => _imageStore,
        ),
        Provider(
          create: (_) => _favoriteStore,
        ),
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
