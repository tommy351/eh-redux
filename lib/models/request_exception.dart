import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

part 'request_exception.freezed.dart';

@freezed
abstract class RequestException with _$RequestException {
  const factory RequestException({
    @Default('GET') String method,
    @required Uri url,
    @required String message,
    @Default(-1) int statusCode,
    @Default('') String body,
  }) = _RequestException;

  factory RequestException.fromResponse({
    @required String message,
    @required Response response,
  }) {
    return RequestException(
      message: message,
      statusCode: response.statusCode,
      body: response.body,
      method: response.request.method,
      url: response.request.url,
    );
  }
}
