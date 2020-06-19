// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RequestException> _$requestExceptionSerializer =
    new _$RequestExceptionSerializer();

class _$RequestExceptionSerializer
    implements StructuredSerializer<RequestException> {
  @override
  final Iterable<Type> types = const [RequestException, _$RequestException];
  @override
  final String wireName = 'RequestException';

  @override
  Iterable<Object> serialize(Serializers serializers, RequestException object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'method',
      serializers.serialize(object.method,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(Uri)),
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
  RequestException deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequestExceptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'method':
          result.method = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(Uri)) as Uri;
          break;
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

class _$RequestException extends RequestException {
  @override
  final String method;
  @override
  final Uri url;
  @override
  final String message;
  @override
  final int statusCode;
  @override
  final String body;

  factory _$RequestException(
          [void Function(RequestExceptionBuilder) updates]) =>
      (new RequestExceptionBuilder()..update(updates)).build()
          as _$RequestException;

  _$RequestException._(
      {this.method, this.url, this.message, this.statusCode, this.body})
      : super._() {
    if (method == null) {
      throw new BuiltValueNullFieldError('RequestException', 'method');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('RequestException', 'url');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('RequestException', 'message');
    }
    if (statusCode == null) {
      throw new BuiltValueNullFieldError('RequestException', 'statusCode');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('RequestException', 'body');
    }
  }

  @override
  RequestException rebuild(void Function(RequestExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RequestExceptionBuilder toBuilder() =>
      new _$RequestExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestException &&
        method == other.method &&
        url == other.url &&
        message == other.message &&
        statusCode == other.statusCode &&
        body == other.body;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, method.hashCode), url.hashCode), message.hashCode),
            statusCode.hashCode),
        body.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RequestException')
          ..add('method', method)
          ..add('url', url)
          ..add('message', message)
          ..add('statusCode', statusCode)
          ..add('body', body))
        .toString();
  }
}

class _$RequestExceptionBuilder extends RequestExceptionBuilder {
  _$RequestException _$v;

  @override
  String get method {
    _$this;
    return super.method;
  }

  @override
  set method(String method) {
    _$this;
    super.method = method;
  }

  @override
  Uri get url {
    _$this;
    return super.url;
  }

  @override
  set url(Uri url) {
    _$this;
    super.url = url;
  }

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

  _$RequestExceptionBuilder() : super._();

  RequestExceptionBuilder get _$this {
    if (_$v != null) {
      super.method = _$v.method;
      super.url = _$v.url;
      super.message = _$v.message;
      super.statusCode = _$v.statusCode;
      super.body = _$v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestException other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RequestException;
  }

  @override
  void update(void Function(RequestExceptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RequestException build() {
    final _$result = _$v ??
        new _$RequestException._(
            method: method,
            url: url,
            message: message,
            statusCode: statusCode,
            body: body);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
