// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ehentai.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RequestExceptionTearOff {
  const _$RequestExceptionTearOff();

// ignore: unused_element
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

/// @nodoc
// ignore: unused_element
const $RequestException = _$RequestExceptionTearOff();

/// @nodoc
mixin _$RequestException {
  String get method;
  Uri get url;
  String get message;
  int get statusCode;
  String get body;

  $RequestExceptionCopyWith<RequestException> get copyWith;
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

@Implements(Exception)

/// @nodoc
class _$_RequestException
    with DiagnosticableTreeMixin
    implements _RequestException {
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

  @override
  _$RequestExceptionCopyWith<_RequestException> get copyWith =>
      __$RequestExceptionCopyWithImpl<_RequestException>(this, _$identity);
}

abstract class _RequestException implements RequestException, Exception {
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

/// @nodoc
class _$ResponseTearOff {
  const _$ResponseTearOff();

// ignore: unused_element
  BaseResponse base({@required int statusCode}) {
    return BaseResponse(
      statusCode: statusCode,
    );
  }

// ignore: unused_element
  HtmlResponse html({@required int statusCode, @required Document document}) {
    return HtmlResponse(
      statusCode: statusCode,
      document: document,
    );
  }

// ignore: unused_element
  ApiResponse api({@required int statusCode, @required dynamic data}) {
    return ApiResponse(
      statusCode: statusCode,
      data: data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Response = _$ResponseTearOff();

/// @nodoc
mixin _$Response {
  int get statusCode;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result base(int statusCode),
    @required Result html(int statusCode, Document document),
    @required Result api(int statusCode, dynamic data),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result base(int statusCode),
    Result html(int statusCode, Document document),
    Result api(int statusCode, dynamic data),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result base(BaseResponse value),
    @required Result html(HtmlResponse value),
    @required Result api(ApiResponse value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result base(BaseResponse value),
    Result html(HtmlResponse value),
    Result api(ApiResponse value),
    @required Result orElse(),
  });

  $ResponseCopyWith<Response> get copyWith;
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
    Object statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed ? _value.statusCode : statusCode as int,
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
    Object statusCode = freezed,
  }) {
    return _then(BaseResponse(
      statusCode: statusCode == freezed ? _value.statusCode : statusCode as int,
    ));
  }
}

/// @nodoc
class _$BaseResponse with DiagnosticableTreeMixin implements BaseResponse {
  const _$BaseResponse({@required this.statusCode})
      : assert(statusCode != null);

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

  @override
  $BaseResponseCopyWith<BaseResponse> get copyWith =>
      _$BaseResponseCopyWithImpl<BaseResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result base(int statusCode),
    @required Result html(int statusCode, Document document),
    @required Result api(int statusCode, dynamic data),
  }) {
    assert(base != null);
    assert(html != null);
    assert(api != null);
    return base(statusCode);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result base(int statusCode),
    Result html(int statusCode, Document document),
    Result api(int statusCode, dynamic data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (base != null) {
      return base(statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result base(BaseResponse value),
    @required Result html(HtmlResponse value),
    @required Result api(ApiResponse value),
  }) {
    assert(base != null);
    assert(html != null);
    assert(api != null);
    return base(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result base(BaseResponse value),
    Result html(HtmlResponse value),
    Result api(ApiResponse value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (base != null) {
      return base(this);
    }
    return orElse();
  }
}

abstract class BaseResponse implements Response {
  const factory BaseResponse({@required int statusCode}) = _$BaseResponse;

  @override
  int get statusCode;
  @override
  $BaseResponseCopyWith<BaseResponse> get copyWith;
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
    Object statusCode = freezed,
    Object document = freezed,
  }) {
    return _then(HtmlResponse(
      statusCode: statusCode == freezed ? _value.statusCode : statusCode as int,
      document: document == freezed ? _value.document : document as Document,
    ));
  }
}

/// @nodoc
class _$HtmlResponse with DiagnosticableTreeMixin implements HtmlResponse {
  const _$HtmlResponse({@required this.statusCode, @required this.document})
      : assert(statusCode != null),
        assert(document != null);

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

  @override
  $HtmlResponseCopyWith<HtmlResponse> get copyWith =>
      _$HtmlResponseCopyWithImpl<HtmlResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result base(int statusCode),
    @required Result html(int statusCode, Document document),
    @required Result api(int statusCode, dynamic data),
  }) {
    assert(base != null);
    assert(html != null);
    assert(api != null);
    return html(statusCode, document);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result base(int statusCode),
    Result html(int statusCode, Document document),
    Result api(int statusCode, dynamic data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (html != null) {
      return html(statusCode, document);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result base(BaseResponse value),
    @required Result html(HtmlResponse value),
    @required Result api(ApiResponse value),
  }) {
    assert(base != null);
    assert(html != null);
    assert(api != null);
    return html(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result base(BaseResponse value),
    Result html(HtmlResponse value),
    Result api(ApiResponse value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (html != null) {
      return html(this);
    }
    return orElse();
  }
}

abstract class HtmlResponse implements Response {
  const factory HtmlResponse(
      {@required int statusCode, @required Document document}) = _$HtmlResponse;

  @override
  int get statusCode;
  Document get document;
  @override
  $HtmlResponseCopyWith<HtmlResponse> get copyWith;
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
    Object statusCode = freezed,
    Object data = freezed,
  }) {
    return _then(ApiResponse(
      statusCode: statusCode == freezed ? _value.statusCode : statusCode as int,
      data: data == freezed ? _value.data : data as dynamic,
    ));
  }
}

/// @nodoc
class _$ApiResponse with DiagnosticableTreeMixin implements ApiResponse {
  const _$ApiResponse({@required this.statusCode, @required this.data})
      : assert(statusCode != null),
        assert(data != null);

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

  @override
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      _$ApiResponseCopyWithImpl<ApiResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result base(int statusCode),
    @required Result html(int statusCode, Document document),
    @required Result api(int statusCode, dynamic data),
  }) {
    assert(base != null);
    assert(html != null);
    assert(api != null);
    return api(statusCode, data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result base(int statusCode),
    Result html(int statusCode, Document document),
    Result api(int statusCode, dynamic data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (api != null) {
      return api(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result base(BaseResponse value),
    @required Result html(HtmlResponse value),
    @required Result api(ApiResponse value),
  }) {
    assert(base != null);
    assert(html != null);
    assert(api != null);
    return api(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result base(BaseResponse value),
    Result html(HtmlResponse value),
    Result api(ApiResponse value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class ApiResponse implements Response {
  const factory ApiResponse(
      {@required int statusCode, @required dynamic data}) = _$ApiResponse;

  @override
  int get statusCode;
  dynamic get data;
  @override
  $ApiResponseCopyWith<ApiResponse> get copyWith;
}
