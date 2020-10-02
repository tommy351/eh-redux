import 'dart:async';
import 'dart:convert';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/utils/cookie.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _log = Logger('LoginScreen');

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  static String route = '/login';

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
        title: Text(AppLocalizations.of(context).logInScreenTitle),
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
    final cookieString =
        jsonDecode(await controller.evaluateJavascript('document.cookie'))
            as String;
    final cookies = parseCookies(cookieString);
    _log.finer('Get cookies: $cookies');

    if (cookies.containsKey('ipb_member_id')) {
      await sessionStore.setSession(cookieString);
      await _cookieManager.clearCookies();
      analytics.logLogin(loginMethod: 'webview');
      Navigator.pop(context);
    }
  }
}
