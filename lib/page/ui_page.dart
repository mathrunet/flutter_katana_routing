part of katana_routing;

abstract class UIPage extends StatefulHookWidget {
  UIPage({Key? key}) : super(key: key);

  /// Key for Scaffold.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// State for Scaffold.
  ScaffoldState get scaffold => scaffoldKey.currentState!;

  final String puid = uuid;

  Widget build(BuildContext context);

  @protected
  @mustCallSuper
  void onInit() {}

  @protected
  @mustCallSuper
  void onDidInit(BuildContext context) {}

  @protected
  @mustCallSuper
  void onDispose() {}

  /// The closest instance of this class that encloses the given context.
  ///
  /// Typical usage:
  ///
  /// ```dart
  /// UIPageState state = UIPage.of(context);
  /// ```
  ///
  /// [context]: Build context.
  static UIPageState of(BuildContext context) {
    final scope = context
        .getElementForInheritedWidgetOfExactType<_UIPageScope>()!
        .widget as _UIPageScope;
    return scope.state;
  }

  /// Build context.
  ///
  /// Only available in Hook timings.
  @protected
  BuildContext get context => useContext();

  /// True to apply safe area to Body.
  @protected
  bool get applySafeArea => true;

  @override
  State<StatefulWidget> createState() => UIPageState();
}

class UIPageState extends State<UIPage> {
  final Map<String, dynamic> _map = {};
  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    widget.onInit();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onDidInit(context);
    });
  }

  @override
  @protected
  @mustCallSuper
  void dispose() {
    super.dispose();
    widget.onDispose();
  }

  void refresh() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return _UIPageScope(
      state: this,
      child: GestureDetector(
        onTap: () => context.unfocus(),
        child: widget.applySafeArea
            ? SafeArea(
                child: widget.build(context),
              )
            : widget.build(context),
      ),
    );
  }
}

class _UIPageScope extends InheritedWidget {
  const _UIPageScope({required Widget child, required this.state, Key? key})
      : super(key: key, child: child);
  final UIPageState state;
  @override
  bool updateShouldNotify(_UIPageScope old) {
    return true;
  }
}
