import 'dart:ui';

import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:ehreader/screens/gallery/screen.dart';
import 'package:ehreader/screens/home/screen.dart';
import 'package:ehreader/screens/search/screen.dart';
import 'package:ehreader/screens/view/screen.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/stores/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
    final httpClient = http.Client();
    final eHentaiClient = EHentaiClient(httpClient: httpClient);

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => eHentaiClient,
        ),
        Provider(
          create: (context) => GalleryStore(client: eHentaiClient),
        ),
        Provider(
          create: (context) => ImageStore(client: eHentaiClient),
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
                navigationBarColor: Colors.transparent,
              ),
          SearchScreen.routeName: (context) => _buildRoute(
                context: context,
                child: const SearchScreen(),
              ),
        },
      ),
    );
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required Widget child,
    Color navigationBarColor = Colors.black,
  }) {
    if (_padding == null) {
      return Container();
    }

    return MediaQuery(
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
              color: navigationBarColor,
            ),
          ),
        ],
      ),
    );
  }
}
