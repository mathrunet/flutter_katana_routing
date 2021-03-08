part of katana_routing;

class UIPage {
  UIPage._();

  /// The closest instance of this class that encloses the given context.
  ///
  /// Typical usage:
  ///
  /// ```dart
  /// UIPageState state = UIPage.of(context);
  /// ```
  ///
  /// [context]: Build context.
  static PageState of(BuildContext context) {
    final scope = context
        .getElementForInheritedWidgetOfExactType<_PageScope>()!
        .widget as _PageScope;
    return scope.state;
  }
}

class _PageScope extends InheritedWidget {
  const _PageScope({required Widget child, required this.state, Key? key})
      : super(key: key, child: child);
  final PageState state;
  @override
  bool updateShouldNotify(_PageScope old) {
    return true;
  }
}
