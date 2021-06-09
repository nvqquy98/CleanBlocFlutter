import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_action.freezed.dart';

@freezed
class PageAction with _$PageAction {
  const factory PageAction.push(Widget widget) = _Push;

  const factory PageAction.pushAll(List<Widget> widgets) = _PushAll;

  const factory PageAction.popAndPush(Widget widget) = _PopAndPush;

  const factory PageAction.popAllAndPush(Widget widget) = _PopAllAndPush;

  const factory PageAction.popAllAndPushAll(List<Widget> widgets) =
      _PopAllAndPushAll;

  const factory PageAction.pop() = _Pop;

  const factory PageAction.popMultiPages(int number) = _PopMultiPages;

  const factory PageAction.popUntilRoot() = _popUntilRoot;

  const factory PageAction.removeAllPagesOfType(Type type) =
      _RemoveAllPagesOfType;
}
