// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'preferences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PreferencesStateTearOff {
  const _$PreferencesStateTearOff();

  _PreferencesStateInitial initial() {
    return const _PreferencesStateInitial();
  }

  _PreferencesStateLoading loading() {
    return const _PreferencesStateLoading();
  }

  _PreferencesStateSuccess success({required PreferencesAction action}) {
    return _PreferencesStateSuccess(
      action: action,
    );
  }

  _PreferencesStateError error([String? error]) {
    return _PreferencesStateError(
      error,
    );
  }

  _PreferencesStateDisplayingModal displayingModal() {
    return const _PreferencesStateDisplayingModal();
  }
}

/// @nodoc
const $PreferencesState = _$PreferencesStateTearOff();

/// @nodoc
mixin _$PreferencesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PreferencesAction action) success,
    required TResult Function(String? error) error,
    required TResult Function() displayingModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreferencesStateInitial value) initial,
    required TResult Function(_PreferencesStateLoading value) loading,
    required TResult Function(_PreferencesStateSuccess value) success,
    required TResult Function(_PreferencesStateError value) error,
    required TResult Function(_PreferencesStateDisplayingModal value)
        displayingModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesStateCopyWith<$Res> {
  factory $PreferencesStateCopyWith(
          PreferencesState value, $Res Function(PreferencesState) then) =
      _$PreferencesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PreferencesStateCopyWithImpl<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  _$PreferencesStateCopyWithImpl(this._value, this._then);

  final PreferencesState _value;
  // ignore: unused_field
  final $Res Function(PreferencesState) _then;
}

/// @nodoc
abstract class _$PreferencesStateInitialCopyWith<$Res> {
  factory _$PreferencesStateInitialCopyWith(_PreferencesStateInitial value,
          $Res Function(_PreferencesStateInitial) then) =
      __$PreferencesStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$PreferencesStateInitialCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res>
    implements _$PreferencesStateInitialCopyWith<$Res> {
  __$PreferencesStateInitialCopyWithImpl(_PreferencesStateInitial _value,
      $Res Function(_PreferencesStateInitial) _then)
      : super(_value, (v) => _then(v as _PreferencesStateInitial));

  @override
  _PreferencesStateInitial get _value =>
      super._value as _PreferencesStateInitial;
}

/// @nodoc

class _$_PreferencesStateInitial implements _PreferencesStateInitial {
  const _$_PreferencesStateInitial();

  @override
  String toString() {
    return 'PreferencesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PreferencesStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PreferencesAction action) success,
    required TResult Function(String? error) error,
    required TResult Function() displayingModal,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreferencesStateInitial value) initial,
    required TResult Function(_PreferencesStateLoading value) loading,
    required TResult Function(_PreferencesStateSuccess value) success,
    required TResult Function(_PreferencesStateError value) error,
    required TResult Function(_PreferencesStateDisplayingModal value)
        displayingModal,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PreferencesStateInitial implements PreferencesState {
  const factory _PreferencesStateInitial() = _$_PreferencesStateInitial;
}

/// @nodoc
abstract class _$PreferencesStateLoadingCopyWith<$Res> {
  factory _$PreferencesStateLoadingCopyWith(_PreferencesStateLoading value,
          $Res Function(_PreferencesStateLoading) then) =
      __$PreferencesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$PreferencesStateLoadingCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res>
    implements _$PreferencesStateLoadingCopyWith<$Res> {
  __$PreferencesStateLoadingCopyWithImpl(_PreferencesStateLoading _value,
      $Res Function(_PreferencesStateLoading) _then)
      : super(_value, (v) => _then(v as _PreferencesStateLoading));

  @override
  _PreferencesStateLoading get _value =>
      super._value as _PreferencesStateLoading;
}

/// @nodoc

class _$_PreferencesStateLoading implements _PreferencesStateLoading {
  const _$_PreferencesStateLoading();

  @override
  String toString() {
    return 'PreferencesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PreferencesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PreferencesAction action) success,
    required TResult Function(String? error) error,
    required TResult Function() displayingModal,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreferencesStateInitial value) initial,
    required TResult Function(_PreferencesStateLoading value) loading,
    required TResult Function(_PreferencesStateSuccess value) success,
    required TResult Function(_PreferencesStateError value) error,
    required TResult Function(_PreferencesStateDisplayingModal value)
        displayingModal,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PreferencesStateLoading implements PreferencesState {
  const factory _PreferencesStateLoading() = _$_PreferencesStateLoading;
}

/// @nodoc
abstract class _$PreferencesStateSuccessCopyWith<$Res> {
  factory _$PreferencesStateSuccessCopyWith(_PreferencesStateSuccess value,
          $Res Function(_PreferencesStateSuccess) then) =
      __$PreferencesStateSuccessCopyWithImpl<$Res>;
  $Res call({PreferencesAction action});
}

/// @nodoc
class __$PreferencesStateSuccessCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res>
    implements _$PreferencesStateSuccessCopyWith<$Res> {
  __$PreferencesStateSuccessCopyWithImpl(_PreferencesStateSuccess _value,
      $Res Function(_PreferencesStateSuccess) _then)
      : super(_value, (v) => _then(v as _PreferencesStateSuccess));

  @override
  _PreferencesStateSuccess get _value =>
      super._value as _PreferencesStateSuccess;

  @override
  $Res call({
    Object? action = freezed,
  }) {
    return _then(_PreferencesStateSuccess(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as PreferencesAction,
    ));
  }
}

/// @nodoc

class _$_PreferencesStateSuccess implements _PreferencesStateSuccess {
  const _$_PreferencesStateSuccess({required this.action});

  @override
  final PreferencesAction action;

  @override
  String toString() {
    return 'PreferencesState.success(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferencesStateSuccess &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$PreferencesStateSuccessCopyWith<_PreferencesStateSuccess> get copyWith =>
      __$PreferencesStateSuccessCopyWithImpl<_PreferencesStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PreferencesAction action) success,
    required TResult Function(String? error) error,
    required TResult Function() displayingModal,
  }) {
    return success(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
  }) {
    return success?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreferencesStateInitial value) initial,
    required TResult Function(_PreferencesStateLoading value) loading,
    required TResult Function(_PreferencesStateSuccess value) success,
    required TResult Function(_PreferencesStateError value) error,
    required TResult Function(_PreferencesStateDisplayingModal value)
        displayingModal,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _PreferencesStateSuccess implements PreferencesState {
  const factory _PreferencesStateSuccess({required PreferencesAction action}) =
      _$_PreferencesStateSuccess;

  PreferencesAction get action;
  @JsonKey(ignore: true)
  _$PreferencesStateSuccessCopyWith<_PreferencesStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PreferencesStateErrorCopyWith<$Res> {
  factory _$PreferencesStateErrorCopyWith(_PreferencesStateError value,
          $Res Function(_PreferencesStateError) then) =
      __$PreferencesStateErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$PreferencesStateErrorCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res>
    implements _$PreferencesStateErrorCopyWith<$Res> {
  __$PreferencesStateErrorCopyWithImpl(_PreferencesStateError _value,
      $Res Function(_PreferencesStateError) _then)
      : super(_value, (v) => _then(v as _PreferencesStateError));

  @override
  _PreferencesStateError get _value => super._value as _PreferencesStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_PreferencesStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PreferencesStateError implements _PreferencesStateError {
  const _$_PreferencesStateError([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'PreferencesState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferencesStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$PreferencesStateErrorCopyWith<_PreferencesStateError> get copyWith =>
      __$PreferencesStateErrorCopyWithImpl<_PreferencesStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PreferencesAction action) success,
    required TResult Function(String? error) error,
    required TResult Function() displayingModal,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreferencesStateInitial value) initial,
    required TResult Function(_PreferencesStateLoading value) loading,
    required TResult Function(_PreferencesStateSuccess value) success,
    required TResult Function(_PreferencesStateError value) error,
    required TResult Function(_PreferencesStateDisplayingModal value)
        displayingModal,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _PreferencesStateError implements PreferencesState {
  const factory _PreferencesStateError([String? error]) =
      _$_PreferencesStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$PreferencesStateErrorCopyWith<_PreferencesStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PreferencesStateDisplayingModalCopyWith<$Res> {
  factory _$PreferencesStateDisplayingModalCopyWith(
          _PreferencesStateDisplayingModal value,
          $Res Function(_PreferencesStateDisplayingModal) then) =
      __$PreferencesStateDisplayingModalCopyWithImpl<$Res>;
}

/// @nodoc
class __$PreferencesStateDisplayingModalCopyWithImpl<$Res>
    extends _$PreferencesStateCopyWithImpl<$Res>
    implements _$PreferencesStateDisplayingModalCopyWith<$Res> {
  __$PreferencesStateDisplayingModalCopyWithImpl(
      _PreferencesStateDisplayingModal _value,
      $Res Function(_PreferencesStateDisplayingModal) _then)
      : super(_value, (v) => _then(v as _PreferencesStateDisplayingModal));

  @override
  _PreferencesStateDisplayingModal get _value =>
      super._value as _PreferencesStateDisplayingModal;
}

/// @nodoc

class _$_PreferencesStateDisplayingModal
    implements _PreferencesStateDisplayingModal {
  const _$_PreferencesStateDisplayingModal();

  @override
  String toString() {
    return 'PreferencesState.displayingModal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferencesStateDisplayingModal);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PreferencesAction action) success,
    required TResult Function(String? error) error,
    required TResult Function() displayingModal,
  }) {
    return displayingModal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
  }) {
    return displayingModal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PreferencesAction action)? success,
    TResult Function(String? error)? error,
    TResult Function()? displayingModal,
    required TResult orElse(),
  }) {
    if (displayingModal != null) {
      return displayingModal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreferencesStateInitial value) initial,
    required TResult Function(_PreferencesStateLoading value) loading,
    required TResult Function(_PreferencesStateSuccess value) success,
    required TResult Function(_PreferencesStateError value) error,
    required TResult Function(_PreferencesStateDisplayingModal value)
        displayingModal,
  }) {
    return displayingModal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
  }) {
    return displayingModal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreferencesStateInitial value)? initial,
    TResult Function(_PreferencesStateLoading value)? loading,
    TResult Function(_PreferencesStateSuccess value)? success,
    TResult Function(_PreferencesStateError value)? error,
    TResult Function(_PreferencesStateDisplayingModal value)? displayingModal,
    required TResult orElse(),
  }) {
    if (displayingModal != null) {
      return displayingModal(this);
    }
    return orElse();
  }
}

abstract class _PreferencesStateDisplayingModal implements PreferencesState {
  const factory _PreferencesStateDisplayingModal() =
      _$_PreferencesStateDisplayingModal;
}
