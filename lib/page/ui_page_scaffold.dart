part of katana_routing;

abstract class UIPageScaffold extends UIPage {
  UIPageScaffold({Key? key}) : super(key: key);

  /// Key for Scaffold.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// State for Scaffold.
  ScaffoldState get scaffold => scaffoldKey.currentState!;

  /// FloatingActionButton's Location.
  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  /// Creating a floating action button.
  ///
  /// [context]: Build context.
  @protected
  Widget? floatingActionButton(BuildContext context) {
    return null;
  }

  /// FloatingActionButton's Animator.
  @protected
  FloatingActionButtonAnimator? get floatingActionButtonAnimator => null;

  /// Creating persistent footer buttons.
  ///
  /// [context]: Build context.
  @protected
  List<Widget>? persistentFooterButtons(BuildContext context) {
    return null;
  }

  /// Creating a body.
  ///
  /// [context]: Build context.
  @protected
  Widget body(BuildContext context);

  /// Creating a drawer.
  ///
  /// [context]: Build context.
  @protected
  Widget? drawer(BuildContext context) {
    return null;
  }

  /// Creating a end drawer.
  ///
  /// [context]: Build context.
  @protected
  Widget? endDrawer(BuildContext context) {
    return null;
  }

  /// Creating a bottom navigation bar.
  ///
  /// [context]: Build context.
  @protected
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  /// Creating a bottom sheet.
  ///
  /// [context]: Build context.
  @protected
  Widget? bottomSheet(BuildContext context) {
    return null;
  }

  /// Background color.
  @protected
  Color? get backgroundColor => null;

  /// Resize to avoid bottom padding.
  @protected
  bool? get resizeToAvoidBottomPadding => null;

  /// Resize to avoid bottom inset.
  @protected
  bool? get resizeToAvoidBottomInset => null;

  /// True if Primary.
  @protected
  bool get primary => true;

  @protected
  DragStartBehavior get drawerDragStartBehavior => DragStartBehavior.start;

  /// True to extend the Body.
  @protected
  bool get extendBody => false;

  /// True to extend the Body behind appbar.
  @protected
  bool get extendBodyBehindAppBar => false;

  /// Scrim color of drawer.
  @protected
  Color? get drawerScrimColor => null;

  /// Edge drag width of drawer.
  @protected
  double? get drawerEdgeDragWidth => null;

  /// Creating a app bar.
  ///
  /// [context]: Build context.
  @protected
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  /// Callback for building.
  ///
  /// Override and use.
  ///
  /// [context]: Build context.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(context),
      body: body(context),
      floatingActionButton: floatingActionButton(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons(context),
      drawer: drawer(context),
      endDrawer: endDrawer(context),
      bottomNavigationBar: bottomNavigationBar(context),
      bottomSheet: bottomSheet(context),
      backgroundColor: backgroundColor ?? context.theme.backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
    );
  }
}
