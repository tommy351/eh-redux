// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_warning_exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContentWarningException extends ContentWarningException {
  @override
  final GalleryId galleryId;
  @override
  final String reason;

  factory _$ContentWarningException(
          [void Function(ContentWarningExceptionBuilder) updates]) =>
      (new ContentWarningExceptionBuilder()..update(updates)).build();

  _$ContentWarningException._({this.galleryId, this.reason}) : super._() {
    if (galleryId == null) {
      throw new BuiltValueNullFieldError(
          'ContentWarningException', 'galleryId');
    }
    if (reason == null) {
      throw new BuiltValueNullFieldError('ContentWarningException', 'reason');
    }
  }

  @override
  ContentWarningException rebuild(
          void Function(ContentWarningExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentWarningExceptionBuilder toBuilder() =>
      new ContentWarningExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentWarningException &&
        galleryId == other.galleryId &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, galleryId.hashCode), reason.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContentWarningException')
          ..add('galleryId', galleryId)
          ..add('reason', reason))
        .toString();
  }
}

class ContentWarningExceptionBuilder
    implements
        Builder<ContentWarningException, ContentWarningExceptionBuilder> {
  _$ContentWarningException _$v;

  GalleryIdBuilder _galleryId;
  GalleryIdBuilder get galleryId =>
      _$this._galleryId ??= new GalleryIdBuilder();
  set galleryId(GalleryIdBuilder galleryId) => _$this._galleryId = galleryId;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

  ContentWarningExceptionBuilder();

  ContentWarningExceptionBuilder get _$this {
    if (_$v != null) {
      _galleryId = _$v.galleryId?.toBuilder();
      _reason = _$v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentWarningException other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContentWarningException;
  }

  @override
  void update(void Function(ContentWarningExceptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContentWarningException build() {
    _$ContentWarningException _$result;
    try {
      _$result = _$v ??
          new _$ContentWarningException._(
              galleryId: galleryId.build(), reason: reason);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'galleryId';
        galleryId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContentWarningException', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
