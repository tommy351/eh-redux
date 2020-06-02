import 'package:ehreader/repositories/ehentai_client.dart';
import 'package:ehreader/screens/gallery/screen.dart';
import 'package:ehreader/screens/home/screen.dart';
import 'package:ehreader/screens/view/screen.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/stores/image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const EHentaiReaderApp());
}

class EHentaiReaderApp extends StatelessWidget {
  const EHentaiReaderApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    final eHentaiClient = EHentaiClient(httpClient: httpClient);

    return MultiProvider(
      providers: [
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
          HomeScreen.routeName: (context) => const HomeScreen(),
          GalleryScreen.routeName: (context) => const GalleryScreen(),
          ViewScreen.routeName: (context) => const ViewScreen(),
        },
      ),
    );
  }
}
