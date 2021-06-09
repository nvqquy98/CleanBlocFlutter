// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'page_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PageActionTearOff {
  const _$PageActionTearOff();

  _Push push(Widget widget) {
    return _Push(
      widget,
    );
  }

  _PushAll pushAll(List<Widget> widgets) {
    return _PushAll(
      widgets,
    );
  }

  _PopAndPush popAndPush(Widget widget) {
    return _PopAndPush(
      widget,
    );
  }

  _PopAllAndPush popAllAndPush(Widget widget) {
    return _PopAllAndPush(
      widget,
    );
  }

  _PopAllAndPushAll popAllAndPushAll(List<Widget> widgets) {
    return _PopAllAndPushAll(
      widgets,
    );
  }

  _Pop pop() {
    return const _Pop();
  }

  _PopMultiPages popMultiPages(int number) {
    return _PopMultiPages(
      number,
    );
  }

  _popUntilRoot popUntilRoot() {
    return const _popUntilRoot();
  }

  _RemoveAllPagesOfType removeAllPagesOfType(Type type) {
    return _RemoveAllPagesOfType(
      type,
    );
  }
}

/// @nodoc
const $PageAction = _$PageActionTearOff();

/// @nodoc
mixin _$PageAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageActionCopyWith<$Res> {
  factory $PageActionCopyWith(
          PageAction value, $Res Function(PageAction) then) =
      _$PageActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$PageActionCopyWithImpl<$Res> implements $PageActionCopyWith<$Res> {
  _$PageActionCopyWithImpl(this._value, this._then);

  final PageAction _value;
  // ignore: unused_field
  final $Res Function(PageAction) _then;
}

/// @nodoc
abstract class _$PushCopyWith<$Res> {
  factory _$PushCopyWith(_Push value, $Res Function(_Push) then) =
      __$PushCopyWithImpl<$Res>;
  $Res call({Widget widget});
}

/// @nodoc
class __$PushCopyWithImpl<$Res> extends _$PageActionCopyWithImpl<$Res>
    implements _$PushCopyWith<$Res> {
  __$PushCopyWithImpl(_Push _value, $Res Function(_Push) _then)
      : super(_value, (v) => _then(v as _Push));

  @override
  _Push get _value => super._value as _Push;

  @override
  $Res call({
    Object? widget = freezed,
  }) {
    return _then(_Push(
      widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_Push implements _Push {
  const _$_Push(this.widget);

  @override
  final Widget widget;

  @override
  String toString() {
    return 'PageAction.push(widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Push &&
            (identical(other.widget, widget) ||
                const DeepCollectionEquality().equals(other.widget, widget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(widget);

  @JsonKey(ignore: true)
  @override
  _$PushCopyWith<_Push> get copyWith =>
      __$PushCopyWithImpl<_Push>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return push(widget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (push != null) {
      return push(widget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return push(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (push != null) {
      return push(this);
    }
    return orElse();
  }
}

abstract class _Push implements PageAction {
  const factory _Push(Widget widget) = _$_Push;

  Widget get widget => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PushCopyWith<_Push> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PushAllCopyWith<$Res> {
  factory _$PushAllCopyWith(_PushAll value, $Res Function(_PushAll) then) =
      __$PushAllCopyWithImpl<$Res>;
  $Res call({List<Widget> widgets});
}

/// @nodoc
class __$PushAllCopyWithImpl<$Res> extends _$PageActionCopyWithImpl<$Res>
    implements _$PushAllCopyWith<$Res> {
  __$PushAllCopyWithImpl(_PushAll _value, $Res Function(_PushAll) _then)
      : super(_value, (v) => _then(v as _PushAll));

  @override
  _PushAll get _value => super._value as _PushAll;

  @override
  $Res call({
    Object? widgets = freezed,
  }) {
    return _then(_PushAll(
      widgets == freezed
          ? _value.widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc

class _$_PushAll implements _PushAll {
  const _$_PushAll(this.widgets);

  @override
  final List<Widget> widgets;

  @override
  String toString() {
    return 'PageAction.pushAll(widgets: $widgets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PushAll &&
            (identical(other.widgets, widgets) ||
                const DeepCollectionEquality().equals(other.widgets, widgets)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(widgets);

  @JsonKey(ignore: true)
  @override
  _$PushAllCopyWith<_PushAll> get copyWith =>
      __$PushAllCopyWithImpl<_PushAll>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return pushAll(widgets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (pushAll != null) {
      return pushAll(widgets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return pushAll(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (pushAll != null) {
      return pushAll(this);
    }
    return orElse();
  }
}

abstract class _PushAll implements PageAction {
  const factory _PushAll(List<Widget> widgets) = _$_PushAll;

  List<Widget> get widgets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PushAllCopyWith<_PushAll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PopAndPushCopyWith<$Res> {
  factory _$PopAndPushCopyWith(
          _PopAndPush value, $Res Function(_PopAndPush) then) =
      __$PopAndPushCopyWithImpl<$Res>;
  $Res call({Widget widget});
}

/// @nodoc
class __$PopAndPushCopyWithImpl<$Res> extends _$PageActionCopyWithImpl<$Res>
    implements _$PopAndPushCopyWith<$Res> {
  __$PopAndPushCopyWithImpl(
      _PopAndPush _value, $Res Function(_PopAndPush) _then)
      : super(_value, (v) => _then(v as _PopAndPush));

  @override
  _PopAndPush get _value => super._value as _PopAndPush;

  @override
  $Res call({
    Object? widget = freezed,
  }) {
    return _then(_PopAndPush(
      widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_PopAndPush implements _PopAndPush {
  const _$_PopAndPush(this.widget);

  @override
  final Widget widget;

  @override
  String toString() {
    return 'PageAction.popAndPush(widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PopAndPush &&
            (identical(other.widget, widget) ||
                const DeepCollectionEquality().equals(other.widget, widget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(widget);

  @JsonKey(ignore: true)
  @override
  _$PopAndPushCopyWith<_PopAndPush> get copyWith =>
      __$PopAndPushCopyWithImpl<_PopAndPush>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return popAndPush(widget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popAndPush != null) {
      return popAndPush(widget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return popAndPush(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popAndPush != null) {
      return popAndPush(this);
    }
    return orElse();
  }
}

abstract class _PopAndPush implements PageAction {
  const factory _PopAndPush(Widget widget) = _$_PopAndPush;

  Widget get widget => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PopAndPushCopyWith<_PopAndPush> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PopAllAndPushCopyWith<$Res> {
  factory _$PopAllAndPushCopyWith(
          _PopAllAndPush value, $Res Function(_PopAllAndPush) then) =
      __$PopAllAndPushCopyWithImpl<$Res>;
  $Res call({Widget widget});
}

/// @nodoc
class __$PopAllAndPushCopyWithImpl<$Res> extends _$PageActionCopyWithImpl<$Res>
    implements _$PopAllAndPushCopyWith<$Res> {
  __$PopAllAndPushCopyWithImpl(
      _PopAllAndPush _value, $Res Function(_PopAllAndPush) _then)
      : super(_value, (v) => _then(v as _PopAllAndPush));

  @override
  _PopAllAndPush get _value => super._value as _PopAllAndPush;

  @override
  $Res call({
    Object? widget = freezed,
  }) {
    return _then(_PopAllAndPush(
      widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_PopAllAndPush implements _PopAllAndPush {
  const _$_PopAllAndPush(this.widget);

  @override
  final Widget widget;

  @override
  String toString() {
    return 'PageAction.popAllAndPush(widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PopAllAndPush &&
            (identical(other.widget, widget) ||
                const DeepCollectionEquality().equals(other.widget, widget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(widget);

  @JsonKey(ignore: true)
  @override
  _$PopAllAndPushCopyWith<_PopAllAndPush> get copyWith =>
      __$PopAllAndPushCopyWithImpl<_PopAllAndPush>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return popAllAndPush(widget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popAllAndPush != null) {
      return popAllAndPush(widget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return popAllAndPush(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popAllAndPush != null) {
      return popAllAndPush(this);
    }
    return orElse();
  }
}

abstract class _PopAllAndPush implements PageAction {
  const factory _PopAllAndPush(Widget widget) = _$_PopAllAndPush;

  Widget get widget => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PopAllAndPushCopyWith<_PopAllAndPush> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PopAllAndPushAllCopyWith<$Res> {
  factory _$PopAllAndPushAllCopyWith(
          _PopAllAndPushAll value, $Res Function(_PopAllAndPushAll) then) =
      __$PopAllAndPushAllCopyWithImpl<$Res>;
  $Res call({List<Widget> widgets});
}

/// @nodoc
class __$PopAllAndPushAllCopyWithImpl<$Res>
    extends _$PageActionCopyWithImpl<$Res>
    implements _$PopAllAndPushAllCopyWith<$Res> {
  __$PopAllAndPushAllCopyWithImpl(
      _PopAllAndPushAll _value, $Res Function(_PopAllAndPushAll) _then)
      : super(_value, (v) => _then(v as _PopAllAndPushAll));

  @override
  _PopAllAndPushAll get _value => super._value as _PopAllAndPushAll;

  @override
  $Res call({
    Object? widgets = freezed,
  }) {
    return _then(_PopAllAndPushAll(
      widgets == freezed
          ? _value.widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc

class _$_PopAllAndPushAll implements _PopAllAndPushAll {
  const _$_PopAllAndPushAll(this.widgets);

  @override
  final List<Widget> widgets;

  @override
  String toString() {
    return 'PageAction.popAllAndPushAll(widgets: $widgets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PopAllAndPushAll &&
            (identical(other.widgets, widgets) ||
                const DeepCollectionEquality().equals(other.widgets, widgets)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(widgets);

  @JsonKey(ignore: true)
  @override
  _$PopAllAndPushAllCopyWith<_PopAllAndPushAll> get copyWith =>
      __$PopAllAndPushAllCopyWithImpl<_PopAllAndPushAll>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return popAllAndPushAll(widgets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popAllAndPushAll != null) {
      return popAllAndPushAll(widgets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return popAllAndPushAll(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popAllAndPushAll != null) {
      return popAllAndPushAll(this);
    }
    return orElse();
  }
}

abstract class _PopAllAndPushAll implements PageAction {
  const factory _PopAllAndPushAll(List<Widget> widgets) = _$_PopAllAndPushAll;

  List<Widget> get widgets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PopAllAndPushAllCopyWith<_PopAllAndPushAll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PopCopyWith<$Res> {
  factory _$PopCopyWith(_Pop value, $Res Function(_Pop) then) =
      __$PopCopyWithImpl<$Res>;
}

/// @nodoc
class __$PopCopyWithImpl<$Res> extends _$PageActionCopyWithImpl<$Res>
    implements _$PopCopyWith<$Res> {
  __$PopCopyWithImpl(_Pop _value, $Res Function(_Pop) _then)
      : super(_value, (v) => _then(v as _Pop));

  @override
  _Pop get _value => super._value as _Pop;
}

/// @nodoc

class _$_Pop implements _Pop {
  const _$_Pop();

  @override
  String toString() {
    return 'PageAction.pop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Pop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return pop();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return pop(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }
}

abstract class _Pop implements PageAction {
  const factory _Pop() = _$_Pop;
}

/// @nodoc
abstract class _$PopMultiPagesCopyWith<$Res> {
  factory _$PopMultiPagesCopyWith(
          _PopMultiPages value, $Res Function(_PopMultiPages) then) =
      __$PopMultiPagesCopyWithImpl<$Res>;
  $Res call({int number});
}

/// @nodoc
class __$PopMultiPagesCopyWithImpl<$Res> extends _$PageActionCopyWithImpl<$Res>
    implements _$PopMultiPagesCopyWith<$Res> {
  __$PopMultiPagesCopyWithImpl(
      _PopMultiPages _value, $Res Function(_PopMultiPages) _then)
      : super(_value, (v) => _then(v as _PopMultiPages));

  @override
  _PopMultiPages get _value => super._value as _PopMultiPages;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_PopMultiPages(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PopMultiPages implements _PopMultiPages {
  const _$_PopMultiPages(this.number);

  @override
  final int number;

  @override
  String toString() {
    return 'PageAction.popMultiPages(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PopMultiPages &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(number);

  @JsonKey(ignore: true)
  @override
  _$PopMultiPagesCopyWith<_PopMultiPages> get copyWith =>
      __$PopMultiPagesCopyWithImpl<_PopMultiPages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return popMultiPages(number);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popMultiPages != null) {
      return popMultiPages(number);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return popMultiPages(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popMultiPages != null) {
      return popMultiPages(this);
    }
    return orElse();
  }
}

abstract class _PopMultiPages implements PageAction {
  const factory _PopMultiPages(int number) = _$_PopMultiPages;

  int get number => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PopMultiPagesCopyWith<_PopMultiPages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$popUntilRootCopyWith<$Res> {
  factory _$popUntilRootCopyWith(
          _popUntilRoot value, $Res Function(_popUntilRoot) then) =
      __$popUntilRootCopyWithImpl<$Res>;
}

/// @nodoc
class __$popUntilRootCopyWithImpl<$Res> extends _$PageActionCopyWithImpl<$Res>
    implements _$popUntilRootCopyWith<$Res> {
  __$popUntilRootCopyWithImpl(
      _popUntilRoot _value, $Res Function(_popUntilRoot) _then)
      : super(_value, (v) => _then(v as _popUntilRoot));

  @override
  _popUntilRoot get _value => super._value as _popUntilRoot;
}

/// @nodoc

class _$_popUntilRoot implements _popUntilRoot {
  const _$_popUntilRoot();

  @override
  String toString() {
    return 'PageAction.popUntilRoot()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _popUntilRoot);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return popUntilRoot();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popUntilRoot != null) {
      return popUntilRoot();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return popUntilRoot(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (popUntilRoot != null) {
      return popUntilRoot(this);
    }
    return orElse();
  }
}

abstract class _popUntilRoot implements PageAction {
  const factory _popUntilRoot() = _$_popUntilRoot;
}

/// @nodoc
abstract class _$RemoveAllPagesOfTypeCopyWith<$Res> {
  factory _$RemoveAllPagesOfTypeCopyWith(_RemoveAllPagesOfType value,
          $Res Function(_RemoveAllPagesOfType) then) =
      __$RemoveAllPagesOfTypeCopyWithImpl<$Res>;
  $Res call({Type type});
}

/// @nodoc
class __$RemoveAllPagesOfTypeCopyWithImpl<$Res>
    extends _$PageActionCopyWithImpl<$Res>
    implements _$RemoveAllPagesOfTypeCopyWith<$Res> {
  __$RemoveAllPagesOfTypeCopyWithImpl(
      _RemoveAllPagesOfType _value, $Res Function(_RemoveAllPagesOfType) _then)
      : super(_value, (v) => _then(v as _RemoveAllPagesOfType));

  @override
  _RemoveAllPagesOfType get _value => super._value as _RemoveAllPagesOfType;

  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_RemoveAllPagesOfType(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
    ));
  }
}

/// @nodoc

class _$_RemoveAllPagesOfType implements _RemoveAllPagesOfType {
  const _$_RemoveAllPagesOfType(this.type);

  @override
  final Type type;

  @override
  String toString() {
    return 'PageAction.removeAllPagesOfType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RemoveAllPagesOfType &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$RemoveAllPagesOfTypeCopyWith<_RemoveAllPagesOfType> get copyWith =>
      __$RemoveAllPagesOfTypeCopyWithImpl<_RemoveAllPagesOfType>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Widget widget) push,
    required TResult Function(List<Widget> widgets) pushAll,
    required TResult Function(Widget widget) popAndPush,
    required TResult Function(Widget widget) popAllAndPush,
    required TResult Function(List<Widget> widgets) popAllAndPushAll,
    required TResult Function() pop,
    required TResult Function(int number) popMultiPages,
    required TResult Function() popUntilRoot,
    required TResult Function(Type type) removeAllPagesOfType,
  }) {
    return removeAllPagesOfType(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Widget widget)? push,
    TResult Function(List<Widget> widgets)? pushAll,
    TResult Function(Widget widget)? popAndPush,
    TResult Function(Widget widget)? popAllAndPush,
    TResult Function(List<Widget> widgets)? popAllAndPushAll,
    TResult Function()? pop,
    TResult Function(int number)? popMultiPages,
    TResult Function()? popUntilRoot,
    TResult Function(Type type)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (removeAllPagesOfType != null) {
      return removeAllPagesOfType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Push value) push,
    required TResult Function(_PushAll value) pushAll,
    required TResult Function(_PopAndPush value) popAndPush,
    required TResult Function(_PopAllAndPush value) popAllAndPush,
    required TResult Function(_PopAllAndPushAll value) popAllAndPushAll,
    required TResult Function(_Pop value) pop,
    required TResult Function(_PopMultiPages value) popMultiPages,
    required TResult Function(_popUntilRoot value) popUntilRoot,
    required TResult Function(_RemoveAllPagesOfType value) removeAllPagesOfType,
  }) {
    return removeAllPagesOfType(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Push value)? push,
    TResult Function(_PushAll value)? pushAll,
    TResult Function(_PopAndPush value)? popAndPush,
    TResult Function(_PopAllAndPush value)? popAllAndPush,
    TResult Function(_PopAllAndPushAll value)? popAllAndPushAll,
    TResult Function(_Pop value)? pop,
    TResult Function(_PopMultiPages value)? popMultiPages,
    TResult Function(_popUntilRoot value)? popUntilRoot,
    TResult Function(_RemoveAllPagesOfType value)? removeAllPagesOfType,
    required TResult orElse(),
  }) {
    if (removeAllPagesOfType != null) {
      return removeAllPagesOfType(this);
    }
    return orElse();
  }
}

abstract class _RemoveAllPagesOfType implements PageAction {
  const factory _RemoveAllPagesOfType(Type type) = _$_RemoveAllPagesOfType;

  Type get type => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RemoveAllPagesOfTypeCopyWith<_RemoveAllPagesOfType> get copyWith =>
      throw _privateConstructorUsedError;
}
