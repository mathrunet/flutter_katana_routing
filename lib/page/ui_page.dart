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
