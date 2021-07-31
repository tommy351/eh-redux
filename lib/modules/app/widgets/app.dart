import 'package:eh_redux/database/database.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'theme_data_builder.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.database,
    required this.preferences,
  }) : super(key: key);

  final Database database;
  final StreamingSharedPreferences preferences;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late SessionStore _sessionStore;
  late DownloadController _downloadController;
  late EHentaiClient _eHentaiClient;
  late SettingStore _settingStore;

  @override
  void initState() {
    super.initState();
    _sessionStore = SessionStore();
    _downloadController = DownloadController(
      downloadTasksDao: widget.database.downloadTasksDao,
      downloadedImagesDao: widget.database.downloadedImagesDao,
      galleriesDao: widget.database.galleriesDao,
    );
    _eHentaiClient = EHentaiClient(sessionStore: _sessionStore);
    _settingStore = SettingStore(widget.preferences);

    _downloadController.resetState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: widget.database),
        Provider.value(value: _sessionStore),
        Provider.value(value: _downloadController),
        Provider.value(value: _eHentaiClient),
        Provider.value(value: _settingStore),
      ],
      child: ThemeDataBuilder(
        builder: (context, theme) {
          return MaterialApp(
            title: 'EH Redux',
            navigatorObservers: [
              firebaseAnalyticsObserver,
            ],
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: theme,
            initialRoute: HomeScreen.route,
            routes: {
              HomeScreen.route: (_) => const HomeScreen(),
              SettingScreen.route: (_) => const SettingScreen(),
              LoginScreen.route: (_) => const LoginScreen(),
              GalleryScreen.route: (context) => GalleryScreen(
                    gallery:
                        ModalRoute.of(context)!.settings.arguments as Gallery,
                  ),
              CheckUpdateScreen.route: (_) => const CheckUpdateScreen(),
              SearchScreen.route: (context) => SearchScreen(
                    arguments: ModalRoute.of(context)!.settings.arguments
                        as SearchArguments,
                  ),
              ImageScreen.route: (context) => ImageScreen(
                    gallery:
                        ModalRoute.of(context)!.settings.arguments as Gallery,
                  ),
            },
          );
        },
      ),
    );
  }
}
