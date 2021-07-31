// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReceivedNotificationTearOff {
  const _$ReceivedNotificationTearOff();

  _ReceivedNotification call(
      {required int id, String? title, String? body, String? payload}) {
    return _ReceivedNotification(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }
}

/// @nodoc
const $ReceivedNotification = _$ReceivedNotificationTearOff();

/// @nodoc
mixin _$ReceivedNotification {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get payload => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReceivedNotificationCopyWith<ReceivedNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedNotificationCopyWith<$Res> {
  factory $ReceivedNotificationCopyWith(ReceivedNotification value,
          $Res Function(ReceivedNotification) then) =
      _$ReceivedNotificationCopyWithImpl<$Res>;
  $Res call({int id, String? title, String? body, String? payload});
}

/// @nodoc
class _$ReceivedNotificationCopyWithImpl<$Res>
    implements $ReceivedNotificationCopyWith<$Res> {
  _$ReceivedNotificationCopyWithImpl(this._value, this._then);

  final ReceivedNotification _value;
  // ignore: unused_field
  final $Res Function(ReceivedNotification) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ReceivedNotificationCopyWith<$Res>
    implements $ReceivedNotificationCopyWith<$Res> {
  factory _$ReceivedNotificationCopyWith(_ReceivedNotification value,
          $Res Function(_ReceivedNotification) then) =
      __$ReceivedNotificationCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? title, String? body, String? payload});
}

/// @nodoc
class __$ReceivedNotificationCopyWithImpl<$Res>
    extends _$ReceivedNotificationCopyWithImpl<$Res>
    implements _$ReceivedNotificationCopyWith<$Res> {
  __$ReceivedNotificationCopyWithImpl(
      _ReceivedNotification _value, $Res Function(_ReceivedNotification) _then)
      : super(_value, (v) => _then(v as _ReceivedNotification));

  @override
  _ReceivedNotification get _value => super._value as _ReceivedNotification;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? payload = freezed,
  }) {
    return _then(_ReceivedNotification(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReceivedNotification implements _ReceivedNotification {
  const _$_ReceivedNotification(
      {required this.id, this.title, this.body, this.payload});

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? payload;

  @override
  String toString() {
    return 'ReceivedNotification(id: $id, title: $title, body: $body, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReceivedNotification &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(payload);

  @JsonKey(ignore: true)
  @override
  _$ReceivedNotificationCopyWith<_ReceivedNotification> get copyWith =>
      __$ReceivedNotificationCopyWithImpl<_ReceivedNotification>(
          this, _$identity);
}

abstract class _ReceivedNotification implements ReceivedNotification {
  const factory _ReceivedNotification(
      {required int id,
      String? title,
      String? body,
      String? payload}) = _$_ReceivedNotification;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get body => throw _privateConstructorUsedError;
  @override
  String? get payload => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReceivedNotificationCopyWith<_ReceivedNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
