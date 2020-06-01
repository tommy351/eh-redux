import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:http/http.dart';

part 'http_exception.g.dart';

abstract class HttpException
    implements Built<HttpException, HttpExceptionBuilder>, Exception {
  static Serializer<HttpException> get serializer => _$httpExceptionSerializer;

  String get message;
  int get statusCode;
  String get body;

  factory HttpException([Function(HttpExceptionBuilder) updates]) =
      _$HttpException;
  HttpException._();

  factory HttpException.fromResponse({String message, Response response}) {
    return HttpException((b) => b
      ..message = message
      ..statusCode = response.statusCode
      ..body = response.body);
  }
}

abstract class HttpExceptionBuilder
    implements Builder<HttpException, HttpExceptionBuilder> {
  String message = '';
  int statusCode = -1;
  String body = '';

  factory HttpExceptionBuilder() = _$HttpExceptionBuilder;
  HttpExceptionBuilder._();
}
