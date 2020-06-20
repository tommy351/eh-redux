// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'request_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RequestExceptionTearOff {
  const _$RequestExceptionTearOff();

  _RequestException call(
      {String method = 'GET',
      @required Uri url,
      @required String message,
      int statusCode = -1,
      String body = ''}) {
    return _RequestException(
      method: method,
      url: url,
      message: message,
      statusCode: statusCode,
      body: body,
    );
  }
}

// ignore: unused_element
const $RequestException = _$RequestExceptionTearOff();

mixin _$RequestException {
  String get method;
  Uri get url;
  String get message;
  int get statusCode;
  String get body;

  $RequestExceptionCopyWith<RequestException> get copyWith;
}

abstract class $RequestExceptionCopyWith<$Res> {
  factory $RequestExceptionCopyWith(
          RequestException value, $Res Function(RequestException) then) =
      _$RequestExceptionCopyWithImpl<$Res>;
  $Res call(
      {String method, Uri url, String message, int statusCode, String body});
}

class _$RequestExceptionCopyWithImpl<$Res>
    implements $RequestExceptionCopyWith<$Res> {
  _$RequestExceptionCopyWithImpl(this._value, this._then);

  final RequestException _value;
  // ignore: unused_field
  final $Res Function(RequestException) _then;

  @override
  $Res call({
    Object method = freezed,
    Object url = freezed,
    Object message = freezed,
    Object statusCode = freezed,
    Object body = freezed,
  }) {
    return _then(_value.copyWith(
      method: method == freezed ? _value.method : method as String,
      url: url == freezed ? _value.url : url as Uri,
      message: message == freezed ? _value.message : message as String,
      statusCode: statusCode == freezed ? _value.statusCode : statusCode as int,
      body: body == freezed ? _value.body : body as String,
    ));
  }
}

abstract class _$RequestExceptionCopyWith<$Res>
    implements $RequestExceptionCopyWith<$Res> {
  factory _$RequestExceptionCopyWith(
          _RequestException value, $Res Function(_RequestException) then) =
      __$RequestExceptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String method, Uri url, String message, int statusCode, String body});
}

class __$RequestExceptionCopyWithImpl<$Res>
    extends _$RequestExceptionCopyWithImpl<$Res>
    implements _$RequestExceptionCopyWith<$Res> {
  __$RequestExceptionCopyWithImpl(
      _RequestException _value, $Res Function(_RequestException) _then)
      : super(_value, (v) => _then(v as _RequestException));

  @override
  _RequestException get _value => super._value as _RequestException;

  @override
  $Res call({
    Object method = freezed,
    Object url = freezed,
    Object message = freezed,
    Object statusCode = freezed,
    Object body = freezed,
  }) {
    return _then(_RequestException(
      method: method == freezed ? _value.method : method as String,
      url: url == freezed ? _value.url : url as Uri,
      message: message == freezed ? _value.message : message as String,
      statusCode: statusCode == freezed ? _value.statusCode : statusCode as int,
      body: body == freezed ? _value.body : body as String,
    ));
  }
}

class _$_RequestException implements _RequestException {
  const _$_RequestException(
      {this.method = 'GET',
      @required this.url,
      @required this.message,
      this.statusCode = -1,
      this.body = ''})
      : assert(method != null),
        assert(url != null),
        assert(message != null),
        assert(statusCode != null),
        assert(body != null);

  @JsonKey(defaultValue: 'GET')
  @override
  final String method;
  @override
  final Uri url;
  @override
  final String message;
  @JsonKey(defaultValue: -1)
  @override
  final int statusCode;
  @JsonKey(defaultValue: '')
  @override
  final String body;

  @override
  String toString() {
    return 'RequestException(method: $method, url: $url, message: $message, statusCode: $statusCode, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestException &&
            (identical(other.method, method) ||
                const DeepCollectionEquality().equals(other.method, method)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(method) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(body);

  @override
  _$RequestExceptionCopyWith<_RequestException> get copyWith =>
      __$RequestExceptionCopyWithImpl<_RequestException>(this, _$identity);
}

abstract class _RequestException implements RequestException {
  const factory _RequestException(
      {String method,
      @required Uri url,
      @required String message,
      int statusCode,
      String body}) = _$_RequestException;

  @override
  String get method;
  @override
  Uri get url;
  @override
  String get message;
  @override
  int get statusCode;
  @override
  String get body;
  @override
  _$RequestExceptionCopyWith<_RequestException> get copyWith;
}
