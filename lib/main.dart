import 'dart:ui';

import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:ehreader/screens/gallery/screen.dart';
import 'package:ehreader/screens/home/screen.dart';
import 'package:ehreader/screens/login/screen.dart';
import 'package:ehreader/screens/search/screen.dart';
import 'package:ehreader/screens/setting/screen.dart';
import 'package:ehreader/screens/view/screen.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/stores/image.dart';
import 'package:ehreader/stores/session.dart';
import 'package:ehreader/stores/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const channel = MethodChannel('app.ehreader/main');

void main() {
  runApp(const EHentaiReaderApp());
}

class EHentaiReaderApp extends StatefulWidget {
  const EHentaiReaderApp({Key key}) : super(key: key);

  @override
  _EHentaiReaderAppState createState() => _EHentaiReaderAppState();
}

class _EHentaiReaderAppState extends State<EHentaiReaderApp> {
  EdgeInsets _padding;

  @override
  void initState() {
    super.initState();
    final dpr = window.devicePixelRatio;
    channel.invokeListMethod<int>('getPaddings').then((value) {
      setState(() {
        _padding = EdgeInsets.only(
          top: value[0] / dpr,
          bottom: value[1] / dpr,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<SharedPreferences>(
          lazy: false,
          create: (_) async => SharedPreferences.getInstance(),
        ),
        FutureProvider<SessionStore>(
          lazy: false,
          create: (_) async {
            final sessionStore = SessionStore(
              secureStorage: const FlutterSecureStorage(),
            );
            await sessionStore.loadSession();
            return sessionStore;
          },
        ),
        ProxyProvider0<SettingStore>(
          update: (context, _) => SettingStore(
            sharedPreferences: Provider.of<SharedPreferences>(context),
          ),
        ),
        ProxyProvider0<EHentaiClient>(
          update: (context, _) => EHentaiClient(
            httpClient: http.Client(),
            sessionStore: Provider.of<SessionStore>(context),
          ),
        ),
        ProxyProvider0<GalleryStore>(
          update: (context, _) => GalleryStore(
            client: Provider.of<EHentaiClient>(context),
          ),
        ),
        ProxyProvider0<ImageStore>(
          update: (context, _) => ImageStore(
            client: Provider.of<EHentaiClient>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'E-Hentai Reader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => _buildRoute(
                context: context,
                child: const HomeScreen(),
              ),
          GalleryScreen.routeName: (context) => _buildRoute(
                context: context,
                child: const GalleryScreen(),
              ),
          ViewScreen.routeName: (context) => _buildRoute(
                context: context,
                child: const ViewScreen(),
                style: SystemUiOverlayStyle.dark.copyWith(
                  systemNavigationBarColor: Colors.transparent,
                ),
              ),
          SearchScreen.routeName: (context) => _buildRoute(
                context: context,
                child: const SearchScreen(),
              ),
          LoginScreen.routeName: (context) => _buildRoute(
                context: context,
                child: const LoginScreen(),
              ),
          SettingScreen.routeName: (context) => _buildRoute(
                context: context,
                child: const SettingScreen(),
              ),
        },
      ),
    );
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required Widget child,
    SystemUiOverlayStyle style,
  }) {
    if (_padding == null) {
      return Container();
    }

    final theme = Theme.of(context);

    final overlayStyle = style ??
        SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: theme.scaffoldBackgroundColor,
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          padding: _padding,
          viewPadding: _padding,
          viewInsets: _padding,
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: child),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: _padding.bottom,
              child: Container(
                color: overlayStyle.systemNavigationBarColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
