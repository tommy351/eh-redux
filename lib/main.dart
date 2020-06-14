import 'dart:async';

import 'package:eh_redux/repositories/ehentai_client.dart';
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
import 'package:eh_redux/utils/firebase.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
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

class _MainAppState extends State<MainApp> {
  SessionStore _sessionStore;
  EHentaiClient _eHentaiClient;
  GalleryStore _galleryStore;
  ImageStore _imageStore;
  SettingStore _settingStore;
  FavoriteStore _favoriteStore;

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
      child: MaterialApp(
        title: 'EH Redux',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          accentColor: Colors.deepOrangeAccent,
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          GalleryScreen.routeName: (_) => const GalleryScreen(),
          ViewScreen.routeName: (_) => const ViewScreen(),
          SearchScreen.routeName: (_) => const SearchScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          SettingScreen.routeName: (_) => const SettingScreen(),
        },
      ),
    );
  }
}
