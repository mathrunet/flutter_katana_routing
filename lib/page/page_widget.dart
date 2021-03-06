part of katana_routing;

abstract class PageWidget extends StatefulHookWidget {
  PageWidget({Key? key}) : super(key: key);

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

  /// Build context.
  ///
  /// Only available in Hook timings.
  @protected
  BuildContext get context => useContext();

  /// True to apply safe area to Body.
  @protected
  bool get applySafeArea => true;

  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<PageWidget> {
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
    return _PageScope(
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

class _PageScope extends InheritedWidget {
  const _PageScope({required Widget child, required this.state, Key? key})
      : super(key: key, child: child);
  final PageState state;
  @override
  bool updateShouldNotify(_PageScope old) {
    return true;
  }
}
