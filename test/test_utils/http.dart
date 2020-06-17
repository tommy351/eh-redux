import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:meta/meta.dart';

class RequestMatcher {
  const RequestMatcher({
    @required this.path,
    this.method = 'GET',
    this.query,
  }) : assert(path != null);

  final String path;
  final String method;
  final Map<String, String> query;

  bool match(Request request) {
    if (request.url.path != path) return false;
    if (request.method != method) return false;

    if (query != null) {
      for (final entry in query.entries) {
        if (request.url.queryParameters[entry.key] != entry.value) {
          return false;
        }
      }
    }

    return true;
  }
}

class _RequestHandler {
  _RequestHandler({
    @required this.matcher,
    @required this.status,
    @required this.body,
    @required this.headers,
  })  : assert(matcher != null),
        assert(status != null),
        assert(body != null);

  final RequestMatcher matcher;
  final int status;
  final String body;
  final Map<String, String> headers;
}

class MockHttpClient {
  MockHttpClient(this.baseUrl) {
    client = MockClient(_handleRequest);
  }

  static const htmlContentType = 'text/html; charset=UTF-8';

  final String baseUrl;
  MockClient client;
  final List<_RequestHandler> _handlers = [];

  void handle({
    @required RequestMatcher matcher,
    int status = 200,
    String body = '',
    Map<String, String> headers,
  }) {
    _handlers.add(_RequestHandler(
      matcher: matcher,
      status: status,
      body: body,
      headers: headers,
    ));
  }

  void clear() {
    _handlers.clear();
  }

  Future<Response> _handleRequest(Request request) async {
    final handler = _handlers.firstWhere(
        (element) => element.matcher.match(request),
        orElse: () => null);

    if (handler == null) {
      throw Exception(
          'Request "${request.method} ${request.url}" is not handled');
    }

    return Response(
      handler.body,
      handler.status,
      headers: handler.headers,
    );
  }
}
