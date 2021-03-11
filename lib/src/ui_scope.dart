part of katana_routing;

class UIScope extends StatefulWidget {
  const UIScope({Key? key, required this.builder}) : super(key: key);
  final Widget Function(
          BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch)
      builder;

  /// The closest instance of this class that encloses the given context.
  ///
  /// Typical usage:
  ///
  /// ```dart
  /// UIPageState state = UIPage.of(context);
  /// ```
  ///
  /// [context]: Build context.
  static UIScopeStateBase of(BuildContext context) {
    final scope = context
        .getElementForInheritedWidgetOfExactType<_UIScope>()!
        .widget as _UIScope;
    return scope.state;
  }

  @override
  State<StatefulWidget> createState() => UIScopeState();
}

class UIScopeState extends State<UIScope> implements UIScopeStateBase {
  @override
  final Map<String, dynamic> _map = {};
  @override
  void rebuild() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return _UIScope(
      state: this,
      child: Consumer(
        key: widget.key,
        builder: (context, watch, child) {
          return widget.builder(context, watch);
        },
      ),
    );
  }
}

abstract class UIScopeStateBase {
  void rebuild();
  Map<String, dynamic> get _map;
}

class _UIScope extends InheritedWidget {
  const _UIScope({required Widget child, required this.state, Key? key})
      : super(key: key, child: child);
  final UIScopeStateBase state;
  @override
  bool updateShouldNotify(_UIScope old) {
    return true;
  }
}
