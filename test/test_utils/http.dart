import 'package:eh_redux/models/request_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:matcher/matcher.dart';
import 'package:meta/meta.dart';

const isRequestException = TypeMatcher<RequestException>();
final Matcher throwsRequestException = throwsA(isRequestException);

class _RequestHandler {
  _RequestHandler({@required this.request, @required this.response})
      : assert(request != null),
        assert(response != null);

  final ExpectedRequest request;
  final Response response;
}

class ExpectedRequest {
  const ExpectedRequest({
    this.method = 'GET',
    @required this.url,
    this.body,
  }) : assert(url != null);

  final String method;
  final Uri url;
  final String body;
}

class MockHttpClient {
  MockHttpClient() {
    client = MockClient(_handleRequest);
  }

  static const htmlContentType = 'text/html; charset=UTF-8';
  static const jsonContentType = 'application/json; charset=UTF-8';

  MockClient client;
  final List<_RequestHandler> _handlers = [];

  void handle({
    @required ExpectedRequest request,
    @required Response response,
  }) {
    _handlers.add(_RequestHandler(
      request: request,
      response: response,
    ));
  }

  void clear() {
    _handlers.clear();
  }

  Future<Response> _handleRequest(Request request) async {
    final handler = _handlers.firstWhere((element) {
      final req = element.request;
      if (req.method != request.method) return false;
      if (req.url != request.url) return false;
      if (req.body != null && req.body != request.body) return false;
      return true;
    }, orElse: () => null);

    if (handler == null) {
      throw Exception('Request "$request" is not handled');
    }

    return handler.response;
  }
}
