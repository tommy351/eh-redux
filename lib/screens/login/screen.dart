import 'dart:async';
import 'dart:developer' as developer;

import 'package:ehreader/stores/session.dart';
import 'package:ehreader/utils/cookie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const _loginUrl = 'https://e-hentai.org/bounce_login.php';

  final _webViewController = Completer<WebViewController>();
  final _cookieManager = CookieManager();

  @override
  Widget build(BuildContext context) {
    final sessionStore = Provider.of<SessionStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: WebView(
        initialUrl: _loginUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _webViewController.complete(controller);
        },
        onPageFinished: (url) {
          _checkCookie(sessionStore);
        },
      ),
    );
  }

  Future<void> _checkCookie(SessionStore sessionStore) async {
    final controller = await _webViewController.future;
    final cookieString = await controller.evaluateJavascript('document.cookie');
    final cookies = parseCookies(cookieString.replaceAll(RegExp(r'^"|"$'), ''));
    developer.log('Get cookies: $cookies');

    if (cookies.containsKey('ipb_member_id')) {
      await sessionStore.setSession(cookieString);
      await _cookieManager.clearCookies();
      Navigator.pop(context);
    }
  }
}
