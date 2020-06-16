import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:http/http.dart';

part 'http_exception.g.dart';

abstract class HttpException
    implements Built<HttpException, HttpExceptionBuilder>, Exception {
  factory HttpException([Function(HttpExceptionBuilder) updates]) =
      _$HttpException;
  HttpException._();

  factory HttpException.fromResponse({String message, Response response}) {
    return HttpException((b) => b
      ..message = message
      ..statusCode = response.statusCode
      ..body = response.body);
  }

  static Serializer<HttpException> get serializer => _$httpExceptionSerializer;

  String get message;
  int get statusCode;
  String get body;
}

abstract class HttpExceptionBuilder
    implements Builder<HttpException, HttpExceptionBuilder> {
  factory HttpExceptionBuilder() = _$HttpExceptionBuilder;
  HttpExceptionBuilder._();

  String message = '';
  int statusCode = -1;
  String body = '';
}
