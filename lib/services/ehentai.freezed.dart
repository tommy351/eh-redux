// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ehentai.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RequestExceptionTearOff {
  const _$RequestExceptionTearOff();

  _RequestException call(
      {String method = 'GET',
      required Uri url,
      required String message,
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

/// @nodoc
const $RequestException = _$RequestExceptionTearOff();

/// @nodoc
mixin _$RequestException {
  String get method => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestExceptionCopyWith<RequestException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestExceptionCopyWith<$Res> {
  factory $RequestExceptionCopyWith(
          RequestException value, $Res Function(RequestException) then) =
      _$RequestExceptionCopyWithImpl<$Res>;
  $Res call(
      {String method, Uri url, String message, int statusCode, String body});
}

/// @nodoc
class _$RequestExceptionCopyWithImpl<$Res>
    implements $RequestExceptionCopyWith<$Res> {
  _$RequestExceptionCopyWithImpl(this._value, this._then);

  final RequestException _value;
  // ignore: unused_field
  final $Res Function(RequestException) _then;

  @override
  $Res call({
    Object? method = freezed,
    Object? url = freezed,
    Object? message = freezed,
    Object? statusCode = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RequestExceptionCopyWith<$Res>
    implements $RequestExceptionCopyWith<$Res> {
  factory _$RequestExceptionCopyWith(
          _RequestException value, $Res Function(_RequestException) then) =
      __$RequestExceptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String method, Uri url, String message, int statusCode, String body});
}

/// @nodoc
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
    Object? method = freezed,
    Object? url = freezed,
    Object? message = freezed,
    Object? statusCode = freezed,
    Object? body = freezed,
  }) {
    return _then(_RequestException(
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Implements(Exception)
class _$_RequestException
    with DiagnosticableTreeMixin
    implements _RequestException {
  const _$_RequestException(
      {this.method = 'GET',
      required this.url,
      required this.message,
      this.statusCode = -1,
      this.body = ''});

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestException(method: $method, url: $url, message: $message, statusCode: $statusCode, body: $body)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestException'))
      ..add(DiagnosticsProperty('method', method))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('body', body));
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

  @JsonKey(ignore: true)
  @override
  _$RequestExceptionCopyWith<_RequestException> get copyWith =>
      __$RequestExceptionCopyWithImpl<_RequestException>(this, _$identity);
}

abstract class _RequestException implements RequestException, Exception {
  const factory _RequestException(
      {String method,
      required Uri url,
      required String message,
      int statusCode,
      String body}) = _$_RequestException;

  @override
  String get method => throw _privateConstructorUsedError;
  @override
  Uri get url => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestExceptionCopyWith<_RequestException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ResponseTearOff {
  const _$ResponseTearOff();

  BaseResponse base({required int statusCode}) {
    return BaseResponse(
      statusCode: statusCode,
    );
  }

  HtmlResponse html({required int statusCode, required Document document}) {
    return HtmlResponse(
      statusCode: statusCode,
      document: document,
    );
  }

  ApiResponse api({required int statusCode, required dynamic data}) {
    return ApiResponse(
      statusCode: statusCode,
      data: data,
    );
  }
}

/// @nodoc
const $Response = _$ResponseTearOff();

/// @nodoc
mixin _$Response {
  int get statusCode => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode) base,
    required TResult Function(int statusCode, Document document) html,
    required TResult Function(int statusCode, dynamic data) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode)? base,
    TResult Function(int statusCode, Document document)? html,
    TResult Function(int statusCode, dynamic data)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseResponse value) base,
    required TResult Function(HtmlResponse value) html,
    required TResult Function(ApiResponse value) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseResponse value)? base,
    TResult Function(HtmlResponse value)? html,
    TResult Function(ApiResponse value)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResponseCopyWith<Response> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCopyWith<$Res> {
  factory $ResponseCopyWith(Response value, $Res Function(Response) then) =
      _$ResponseCopyWithImpl<$Res>;
  $Res call({int statusCode});
}

/// @nodoc
class _$ResponseCopyWithImpl<$Res> implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._value, this._then);

  final Response _value;
  // ignore: unused_field
  final $Res Function(Response) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $BaseResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory $BaseResponseCopyWith(
          BaseResponse value, $Res Function(BaseResponse) then) =
      _$BaseResponseCopyWithImpl<$Res>;
  @override
  $Res call({int statusCode});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements $BaseResponseCopyWith<$Res> {
  _$BaseResponseCopyWithImpl(
      BaseResponse _value, $Res Function(BaseResponse) _then)
      : super(_value, (v) => _then(v as BaseResponse));

  @override
  BaseResponse get _value => super._value as BaseResponse;

  @override
  $Res call({
    Object? statusCode = freezed,
  }) {
    return _then(BaseResponse(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BaseResponse with DiagnosticableTreeMixin implements BaseResponse {
  const _$BaseResponse({required this.statusCode});

  @override
  final int statusCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Response.base(statusCode: $statusCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Response.base'))
      ..add(DiagnosticsProperty('statusCode', statusCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BaseResponse &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(statusCode);

  @JsonKey(ignore: true)
  @override
  $BaseResponseCopyWith<BaseResponse> get copyWith =>
      _$BaseResponseCopyWithImpl<BaseResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode) base,
    required TResult Function(int statusCode, Document document) html,
    required TResult Function(int statusCode, dynamic data) api,
  }) {
    return base(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode)? base,
    TResult Function(int statusCode, Document document)? html,
    TResult Function(int statusCode, dynamic data)? api,
    required TResult orElse(),
  }) {
    if (base != null) {
      return base(statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseResponse value) base,
    required TResult Function(HtmlResponse value) html,
    required TResult Function(ApiResponse value) api,
  }) {
    return base(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseResponse value)? base,
    TResult Function(HtmlResponse value)? html,
    TResult Function(ApiResponse value)? api,
    required TResult orElse(),
  }) {
    if (base != null) {
      return base(this);
    }
    return orElse();
  }
}

abstract class BaseResponse implements Response {
  const factory BaseResponse({required int statusCode}) = _$BaseResponse;

  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $BaseResponseCopyWith<BaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HtmlResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory $HtmlResponseCopyWith(
          HtmlResponse value, $Res Function(HtmlResponse) then) =
      _$HtmlResponseCopyWithImpl<$Res>;
  @override
  $Res call({int statusCode, Document document});
}

/// @nodoc
class _$HtmlResponseCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements $HtmlResponseCopyWith<$Res> {
  _$HtmlResponseCopyWithImpl(
      HtmlResponse _value, $Res Function(HtmlResponse) _then)
      : super(_value, (v) => _then(v as HtmlResponse));

  @override
  HtmlResponse get _value => super._value as HtmlResponse;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? document = freezed,
  }) {
    return _then(HtmlResponse(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      document: document == freezed
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
    ));
  }
}

/// @nodoc

class _$HtmlResponse with DiagnosticableTreeMixin implements HtmlResponse {
  const _$HtmlResponse({required this.statusCode, required this.document});

  @override
  final int statusCode;
  @override
  final Document document;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Response.html(statusCode: $statusCode, document: $document)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Response.html'))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('document', document));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HtmlResponse &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.document, document) ||
                const DeepCollectionEquality()
                    .equals(other.document, document)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(document);

  @JsonKey(ignore: true)
  @override
  $HtmlResponseCopyWith<HtmlResponse> get copyWith =>
      _$HtmlResponseCopyWithImpl<HtmlResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode) base,
    required TResult Function(int statusCode, Document document) html,
    required TResult Function(int statusCode, dynamic data) api,
  }) {
    return html(statusCode, document);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode)? base,
    TResult Function(int statusCode, Document document)? html,
    TResult Function(int statusCode, dynamic data)? api,
    required TResult orElse(),
  }) {
    if (html != null) {
      return html(statusCode, document);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseResponse value) base,
    required TResult Function(HtmlResponse value) html,
    required TResult Function(ApiResponse value) api,
  }) {
    return html(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseResponse value)? base,
    TResult Function(HtmlResponse value)? html,
    TResult Function(ApiResponse value)? api,
    required TResult orElse(),
  }) {
    if (html != null) {
      return html(this);
    }
    return orElse();
  }
}

abstract class HtmlResponse implements Response {
  const factory HtmlResponse(
      {required int statusCode, required Document document}) = _$HtmlResponse;

  @override
  int get statusCode => throw _privateConstructorUsedError;
  Document get document => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $HtmlResponseCopyWith<HtmlResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res>;
  @override
  $Res call({int statusCode, dynamic data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res> extends _$ResponseCopyWithImpl<$Res>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(
      ApiResponse _value, $Res Function(ApiResponse) _then)
      : super(_value, (v) => _then(v as ApiResponse));

  @override
  ApiResponse get _value => super._value as ApiResponse;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? data = freezed,
  }) {
    return _then(ApiResponse(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ApiResponse with DiagnosticableTreeMixin implements ApiResponse {
  const _$ApiResponse({required this.statusCode, required this.data});

  @override
  final int statusCode;
  @override
  final dynamic data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Response.api(statusCode: $statusCode, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Response.api'))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiResponse &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      _$ApiResponseCopyWithImpl<ApiResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode) base,
    required TResult Function(int statusCode, Document document) html,
    required TResult Function(int statusCode, dynamic data) api,
  }) {
    return api(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode)? base,
    TResult Function(int statusCode, Document document)? html,
    TResult Function(int statusCode, dynamic data)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseResponse value) base,
    required TResult Function(HtmlResponse value) html,
    required TResult Function(ApiResponse value) api,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseResponse value)? base,
    TResult Function(HtmlResponse value)? html,
    TResult Function(ApiResponse value)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class ApiResponse implements Response {
  const factory ApiResponse({required int statusCode, required dynamic data}) =
      _$ApiResponse;

  @override
  int get statusCode => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
