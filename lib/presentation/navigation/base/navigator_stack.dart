import 'package:flutter/material.dart';

class NavigatorStack {
  final List<Page> _pages = [];

  List<Page> get pages => List.unmodifiable(_pages);

  void addAll(List<Widget> initialPages) {
    _pages.addAll(initialPages.map(_createPage));
  }

  void pop() {
    _pages.removeLast();
  }

  void popAll() {
    _pages.clear();
  }

  void popMultiPages(int number) {
    for (var i = 1; i <= number; i++) {
      pop();
    }
  }

  void popUntilRoot() {
    popMultiPages(_pages.length - 1);
  }

  void removeAllPagesOfType(Type runtimeType) {
    _pages.removeWhere((page) => page.runtimeType == runtimeType);
  }

  void push(Widget widget) {
    _pages.add(_createPage(widget));
  }

  void pushAll(List<Widget> widgets) {
    widgets.map(push);
  }

  void popAndPush(Widget widget) {
    pop();
    push(widget);
  }

  void popAllAndPush(Widget widget) {
    popAll();
    push(widget);
  }

  void popAllAndPushAll(List<Widget> widgets) {
    popAll();
    pushAll(widgets);
  }

  void removePageAt(int index) {
    _pages.removeAt(index);
  }

  void removeMultiPages(int fromInclusive, int toInclusive) {
    _pages.removeRange(fromInclusive, toInclusive + 1);
  }

  void insertPageAt(int index, Widget widget) {
    _pages.insert(index, _createPage(widget));
  }

  void insertMultiPages(int index, List<Widget> widgets) {
    _pages.insertAll(index, widgets.map(_createPage));
  }

  MaterialPage _createPage(Widget child) {
    return MaterialPage(
      child: child,
      name: child.runtimeType.toString(),
      key: ValueKey(child.runtimeType.toString()),
    );
  }

  @override
  String toString() {
    return 'Stack: ${_pages.map((e) => e.name).join(' -> ')}';
  }
}