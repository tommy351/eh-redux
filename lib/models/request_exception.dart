import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:http/http.dart';

part 'request_exception.g.dart';

abstract class RequestException
    implements Built<RequestException, RequestExceptionBuilder>, Exception {
  factory RequestException([Function(RequestExceptionBuilder) updates]) =
      _$RequestException;
  RequestException._();

  factory RequestException.fromResponse({String message, Response response}) {
    return RequestException((b) => b
      ..message = message
      ..statusCode = response.statusCode
      ..body = response.body);
  }

  static Serializer<RequestException> get serializer => _$requestExceptionSerializer;

  String get message;
  int get statusCode;
  String get body;
}

abstract class RequestExceptionBuilder
    implements Builder<RequestException, RequestExceptionBuilder> {
  factory RequestExceptionBuilder() = _$RequestExceptionBuilder;
  RequestExceptionBuilder._();

  String message = '';
  int statusCode = -1;
  String body = '';
}
