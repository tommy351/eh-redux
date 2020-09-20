import 'dart:convert';
import 'dart:io';

import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/utils/http.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

part 'ehentai.freezed.dart';

@freezed
abstract class RequestException with _$RequestException {
  @Implements(Exception)
  const factory RequestException({
    @Default('GET') String method,
    @required Uri url,
    @required String message,
    @Default(-1) int statusCode,
    @Default('') String body,
  }) = _RequestException;

  factory RequestException.fromBaseResponse({
    @required String message,
    @required http.BaseResponse response,
  }) {
    return RequestException(
      message: message,
      statusCode: response.statusCode,
      method: response.request.method,
      url: response.request.url,
    );
  }

  factory RequestException.fromResponse({
    @required String message,
    @required http.Response response,
  }) {
    return RequestException.fromBaseResponse(
      message: message,
      response: response,
    ).copyWith(body: response.body);
  }
}

@freezed
abstract class Response with _$Response {
  const factory Response.base({
    @required int statusCode,
  }) = BaseResponse;

  const factory Response.html({
    @required int statusCode,
    @required Document document,
  }) = HtmlResponse;

  const factory Response.api({
    @required int statusCode,
    @required dynamic data,
  }) = ApiResponse;
}

class EHentaiClient {
  EHentaiClient({
    http.Client httpClient,
    SessionStore sessionStore,
  })  : _httpClient = httpClient ?? http.Client(),
        _sessionStore = sessionStore ?? SessionStore();

  static const _domain = 'e-hentai.org';
  static const _apiUrl = 'https://api.e-hentai.org/api.php';
  static const _userAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36';
  static final _log = Logger('EHentaiClient');

  final http.Client _httpClient;
  final SessionStore _sessionStore;

  Future<Map<String, String>> _getRequestHeaders({
    bool disableContentWarning = false,
  }) async {
    final cookies = [await _sessionStore.session];

    if (disableContentWarning) {
      cookies.add('nw=1');
    }

    return {
      HttpHeaders.cookieHeader: cookies.join(';'),
      HttpHeaders.userAgentHeader: _userAgent,
    };
  }

  Uri getUri(
    String path, {
    Map<String, String> params,
  }) {
    return Uri.https(_domain, path, params);
  }

  Future<HtmlResponse> getHtml(
    String path, {
    Map<String, String> params,
    bool disableContentWarning = false,
  }) async {
    _log.fine(
        'getHtml: path=$path, params=$params, disableContentWarning=$disableContentWarning');

    final uri = getUri(path, params: params);
    _log.finer('URI: $uri');

    final res = await _httpClient.get(
      uri,
      headers: await _getRequestHeaders(
        disableContentWarning: disableContentWarning,
      ),
    );

    _log.finer('HTML response: statusCode=${res.statusCode}');

    if (!isStatusCodeOk(res.statusCode)) {
      throw RequestException.fromResponse(
        message: 'Failed to get HTML',
        response: res,
      );
    }

    return HtmlResponse(
      statusCode: res.statusCode,
      document: parse(res.body),
    );
  }

  Future<Response> postForm(
    String path, {
    Map<String, String> params,
    dynamic body,
  }) async {
    _log.fine('postForm: path=$path, params=$params, body=$body');

    final uri = getUri(path, params: params);
    _log.finer('URI: $uri');

    final res = await _httpClient.post(
      getUri(path, params: params),
      headers: await _getRequestHeaders(),
      body: body,
    );

    _log.finer('postForm response: statusCode=${res.statusCode}');

    if (!isStatusCodeOk(res.statusCode)) {
      throw RequestException.fromResponse(
        message: 'Failed to post form',
        response: res,
      );
    }

    return Response.base(
      statusCode: res.statusCode,
    );
  }

  Future<ApiResponse> requestApi(dynamic data) async {
    _log.fine('requestApi: data=$data');
    final res = await _httpClient.post(
      _apiUrl,
      body: jsonEncode(data),
      headers: {
        ...await _getRequestHeaders(),
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    _log.finer('API response: statusCode=${res.statusCode}');

    if (!isStatusCodeOk(res.statusCode)) {
      throw RequestException.fromResponse(
        message: 'Failed to request API',
        response: res,
      );
    }

    return ApiResponse(
      statusCode: res.statusCode,
      data: jsonDecode(res.body),
    );
  }
}
