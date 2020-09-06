// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'tabs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TabTearOff {
  const _$TabTearOff();

// ignore: unused_element
  _Tab call(
      {@required String name,
      @required IconData icon,
      @required String Function(BuildContext) title,
      @required Widget Function(BuildContext) widget}) {
    return _Tab(
      name: name,
      icon: icon,
      title: title,
      widget: widget,
    );
  }
}

// ignore: unused_element
const $Tab = _$TabTearOff();

mixin _$Tab {
  String get name;
  IconData get icon;
  String Function(BuildContext) get title;
  Widget Function(BuildContext) get widget;

  $TabCopyWith<Tab> get copyWith;
}

abstract class $TabCopyWith<$Res> {
  factory $TabCopyWith(Tab value, $Res Function(Tab) then) =
      _$TabCopyWithImpl<$Res>;
  $Res call(
      {String name,
      IconData icon,
      String Function(BuildContext) title,
      Widget Function(BuildContext) widget});
}

class _$TabCopyWithImpl<$Res> implements $TabCopyWith<$Res> {
  _$TabCopyWithImpl(this._value, this._then);

  final Tab _value;
  // ignore: unused_field
  final $Res Function(Tab) _then;

  @override
  $Res call({
    Object name = freezed,
    Object icon = freezed,
    Object title = freezed,
    Object widget = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      icon: icon == freezed ? _value.icon : icon as IconData,
      title: title == freezed
          ? _value.title
          : title as String Function(BuildContext),
      widget: widget == freezed
          ? _value.widget
          : widget as Widget Function(BuildContext),
    ));
  }
}

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

class __$TabCopyWithImpl<$Res> extends _$TabCopyWithImpl<$Res>
    implements _$TabCopyWith<$Res> {
  __$TabCopyWithImpl(_Tab _value, $Res Function(_Tab) _then)
      : super(_value, (v) => _then(v as _Tab));

  @override
  _Tab get _value => super._value as _Tab;

  @override
  $Res call({
    Object name = freezed,
    Object icon = freezed,
    Object title = freezed,
    Object widget = freezed,
  }) {
    return _then(_Tab(
      name: name == freezed ? _value.name : name as String,
      icon: icon == freezed ? _value.icon : icon as IconData,
      title: title == freezed
          ? _value.title
          : title as String Function(BuildContext),
      widget: widget == freezed
          ? _value.widget
          : widget as Widget Function(BuildContext),
    ));
  }
}

class _$_Tab implements _Tab {
  const _$_Tab(
      {@required this.name,
      @required this.icon,
      @required this.title,
      @required this.widget})
      : assert(name != null),
        assert(icon != null),
        assert(title != null),
        assert(widget != null);

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

  @override
  _$TabCopyWith<_Tab> get copyWith =>
      __$TabCopyWithImpl<_Tab>(this, _$identity);
}

abstract class _Tab implements Tab {
  const factory _Tab(
      {@required String name,
      @required IconData icon,
      @required String Function(BuildContext) title,
      @required Widget Function(BuildContext) widget}) = _$_Tab;

  @override
  String get name;
  @override
  IconData get icon;
  @override
  String Function(BuildContext) get title;
  @override
  Widget Function(BuildContext) get widget;
  @override
  _$TabCopyWith<_Tab> get copyWith;
}
