import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/generated/l10n.dart';
import 'package:eh_redux/modules/check_update/widgets/screen.dart';
import 'package:eh_redux/modules/download/controller.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/modules/gallery/widgets/screen.dart';
import 'package:eh_redux/modules/home/widgets/screen.dart';
import 'package:eh_redux/modules/image/widgets/screen.dart';
import 'package:eh_redux/modules/login/widgets/screen.dart';
import 'package:eh_redux/modules/search/types.dart';
import 'package:eh_redux/modules/search/widgets/screen.dart';
import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/modules/setting/store.dart';
import 'package:eh_redux/modules/setting/widgets/screen.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'firebase_builder.dart';
import 'theme_data_builder.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Database _database;
  SessionStore _sessionStore;
  DownloadController _downloadController;
  EHentaiClient _eHentaiClient;

  @override
  void initState() {
    super.initState();
    _database = Database();
    _sessionStore = SessionStore();
    _downloadController = DownloadController(
      downloadTasksDao: _database.downloadTasksDao,
      galleriesDao: _database.galleriesDao,
    );
    _eHentaiClient = EHentaiClient(sessionStore: _sessionStore);
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider.value(value: StreamingSharedPreferences.instance),
        Provider.value(value: _database),
        Provider.value(value: _sessionStore),
        Provider.value(value: _downloadController),
        Provider.value(value: _eHentaiClient),
        ProxyProvider0(
          update: (context, _) {
            final prefs = Provider.of<StreamingSharedPreferences>(context);
            return SettingStore(prefs);
          },
        ),
      ],
      child: FirebaseBuilder(
        child: ThemeDataBuilder(
          builder: (context, theme) {
            return MaterialApp(
              title: 'EH Redux',
              navigatorObservers: [
                firebaseAnalyticsObserver,
              ],
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: theme,
              initialRoute: HomeScreen.route,
              routes: {
                HomeScreen.route: (_) => const HomeScreen(),
                SettingScreen.route: (_) => const SettingScreen(),
                LoginScreen.route: (_) => const LoginScreen(),
                GalleryScreen.route: (context) => GalleryScreen(
                      gallery:
                          ModalRoute.of(context).settings.arguments as Gallery,
                    ),
                CheckUpdateScreen.route: (_) => const CheckUpdateScreen(),
                SearchScreen.route: (context) => SearchScreen(
                      arguments: ModalRoute.of(context).settings.arguments
                          as SearchArguments,
                    ),
                ImageScreen.route: (context) => ImageScreen(
                      gallery:
                          ModalRoute.of(context).settings.arguments as Gallery,
                    ),
              },
            );
          },
        ),
      ),
    );
  }
}
