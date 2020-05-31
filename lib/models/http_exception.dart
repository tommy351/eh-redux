import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@immutable
class HttpException extends Equatable implements Exception {
  final String message;
  final int statusCode;
  final String body;

  HttpException({
    this.message = 'HTTP error',
    this.statusCode = -1,
    this.body = '',
  });

  factory HttpException.fromResponse({String message, Response response}) {
    return HttpException(
      message: message,
      statusCode: response.statusCode,
      body: response.body,
    );
  }

  @override
  String toString() => "$message (status $statusCode): $body";

  @override
  List<Object> get props => [message, statusCode, body];
}
