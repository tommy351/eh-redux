import 'package:eh_redux/repositories/ehentai_client.dart';
import 'package:eh_redux/screens/gallery/screen.dart';
import 'package:eh_redux/screens/home/screen.dart';
import 'package:eh_redux/screens/login/screen.dart';
import 'package:eh_redux/screens/search/screen.dart';
import 'package:eh_redux/screens/setting/screen.dart';
import 'package:eh_redux/screens/view/screen.dart';
import 'package:eh_redux/stores/gallery.dart';
import 'package:eh_redux/stores/image.dart';
import 'package:eh_redux/stores/session.dart';
import 'package:eh_redux/stores/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() => runApp(const EHentaiReaderApp());

class EHentaiReaderApp extends StatefulWidget {
  const EHentaiReaderApp({Key key}) : super(key: key);

  @override
  _EHentaiReaderAppState createState() => _EHentaiReaderAppState();
}

class _EHentaiReaderAppState extends State<EHentaiReaderApp> {
  SessionStore _sessionStore;
  EHentaiClient _eHentaiClient;
  GalleryStore _galleryStore;
  ImageStore _imageStore;
  SettingStore _settingStore;

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
      ],
      child: MaterialApp(
        title: 'EH Redux',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => const _Route(
                child: HomeScreen(),
              ),
          GalleryScreen.routeName: (_) => const _Route(
                child: GalleryScreen(),
              ),
          ViewScreen.routeName: (_) => const _Route(
                child: ViewScreen(),
              ),
          SearchScreen.routeName: (_) => const _Route(
                child: SearchScreen(),
              ),
          LoginScreen.routeName: (_) => const _Route(
                child: LoginScreen(),
              ),
          SettingScreen.routeName: (_) => const _Route(
                child: SettingScreen(),
              ),
        },
      ),
    );
  }
}

class _Route extends StatelessWidget {
  final Widget child;

  const _Route({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        padding: mediaQuery.padding + mediaQuery.viewInsets,
        viewPadding: mediaQuery.viewPadding + mediaQuery.viewInsets,
      ),
      child: child,
    );
  }
}
