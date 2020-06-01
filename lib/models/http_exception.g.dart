// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HttpException> _$httpExceptionSerializer =
    new _$HttpExceptionSerializer();

class _$HttpExceptionSerializer implements StructuredSerializer<HttpException> {
  @override
  final Iterable<Type> types = const [HttpException, _$HttpException];
  @override
  final String wireName = 'HttpException';

  @override
  Iterable<Object> serialize(Serializers serializers, HttpException object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'statusCode',
      serializers.serialize(object.statusCode,
          specifiedType: const FullType(int)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HttpException deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HttpExceptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statusCode':
          result.statusCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HttpException extends HttpException {
  @override
  final String message;
  @override
  final int statusCode;
  @override
  final String body;

  factory _$HttpException([void Function(HttpExceptionBuilder) updates]) =>
      (new HttpExceptionBuilder()..update(updates)).build() as _$HttpException;

  _$HttpException._({this.message, this.statusCode, this.body}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('HttpException', 'message');
    }
    if (statusCode == null) {
      throw new BuiltValueNullFieldError('HttpException', 'statusCode');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('HttpException', 'body');
    }
  }

  @override
  HttpException rebuild(void Function(HttpExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$HttpExceptionBuilder toBuilder() =>
      new _$HttpExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HttpException &&
        message == other.message &&
        statusCode == other.statusCode &&
        body == other.body;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, message.hashCode), statusCode.hashCode), body.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HttpException')
          ..add('message', message)
          ..add('statusCode', statusCode)
          ..add('body', body))
        .toString();
  }
}

class _$HttpExceptionBuilder extends HttpExceptionBuilder {
  _$HttpException _$v;

  @override
  String get message {
    _$this;
    return super.message;
  }

  @override
  set message(String message) {
    _$this;
    super.message = message;
  }

  @override
  int get statusCode {
    _$this;
    return super.statusCode;
  }

  @override
  set statusCode(int statusCode) {
    _$this;
    super.statusCode = statusCode;
  }

  @override
  String get body {
    _$this;
    return super.body;
  }

  @override
  set body(String body) {
    _$this;
    super.body = body;
  }

  _$HttpExceptionBuilder() : super._();

  HttpExceptionBuilder get _$this {
    if (_$v != null) {
      super.message = _$v.message;
      super.statusCode = _$v.statusCode;
      super.body = _$v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HttpException other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HttpException;
  }

  @override
  void update(void Function(HttpExceptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HttpException build() {
    final _$result = _$v ??
        new _$HttpException._(
            message: message, statusCode: statusCode, body: body);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
