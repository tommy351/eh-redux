// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'tabs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TabTearOff {
  const _$TabTearOff();

  _Tab call(
      {required String name,
      required IconData icon,
      required String Function(BuildContext) title,
      required Widget Function(BuildContext) widget}) {
    return _Tab(
      name: name,
      icon: icon,
      title: title,
      widget: widget,
    );
  }
}

/// @nodoc
const $Tab = _$TabTearOff();

/// @nodoc
mixin _$Tab {
  String get name => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String Function(BuildContext) get title => throw _privateConstructorUsedError;
  Widget Function(BuildContext) get widget =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabCopyWith<Tab> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabCopyWith<$Res> {
  factory $TabCopyWith(Tab value, $Res Function(Tab) then) =
      _$TabCopyWithImpl<$Res>;
  $Res call(
      {String name,
      IconData icon,
      String Function(BuildContext) title,
      Widget Function(BuildContext) widget});
}

/// @nodoc
class _$TabCopyWithImpl<$Res> implements $TabCopyWith<$Res> {
  _$TabCopyWithImpl(this._value, this._then);

  final Tab _value;
  // ignore: unused_field
  final $Res Function(Tab) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
    Object? title = freezed,
    Object? widget = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget Function(BuildContext),
    ));
  }
}

/// @nodoc
abstract class _$TabCopyWith<$Res> implements $TabCopyWith<$Res> {
  factory _$TabCopyWith(_Tab value, $Res Function(_Tab) then) =
      __$TabCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      IconData icon,
      String Function(BuildContext) title,
      Widget Function(BuildContext) widget});
}

/// @nodoc
class __$TabCopyWithImpl<$Res> extends _$TabCopyWithImpl<$Res>
    implements _$TabCopyWith<$Res> {
  __$TabCopyWithImpl(_Tab _value, $Res Function(_Tab) _then)
      : super(_value, (v) => _then(v as _Tab));

  @override
  _Tab get _value => super._value as _Tab;

  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
    Object? title = freezed,
    Object? widget = freezed,
  }) {
    return _then(_Tab(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget Function(BuildContext),
    ));
  }
}

/// @nodoc

class _$_Tab implements _Tab {
  const _$_Tab(
      {required this.name,
      required this.icon,
      required this.title,
      required this.widget});

  @override
  final String name;
  @override
  final IconData icon;
  @override
  final String Function(BuildContext) title;
  @override
  final Widget Function(BuildContext) widget;

  @override
  String toString() {
    return 'Tab(name: $name, icon: $icon, title: $title, widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Tab &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.widget, widget) ||
                const DeepCollectionEquality().equals(other.widget, widget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(widget);

  @JsonKey(ignore: true)
  @override
  _$TabCopyWith<_Tab> get copyWith =>
      __$TabCopyWithImpl<_Tab>(this, _$identity);
}

abstract class _Tab implements Tab {
  const factory _Tab(
      {required String name,
      required IconData icon,
      required String Function(BuildContext) title,
      required Widget Function(BuildContext) widget}) = _$_Tab;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  IconData get icon => throw _privateConstructorUsedError;
  @override
  String Function(BuildContext) get title => throw _privateConstructorUsedError;
  @override
  Widget Function(BuildContext) get widget =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TabCopyWith<_Tab> get copyWith => throw _privateConstructorUsedError;
}
