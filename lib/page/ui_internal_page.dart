part of katana_routing;

abstract class UIInternalPage extends UIPage {
  /// Used to display a page within a page.
  ///
  /// [key]: Widget key.
  UIInternalPage({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  /// Keys for the navigator.
  NavigatorState get navigator => _navigatorKey.currentState!;

  /// The name of the first route on the page.
  String get initialRoute;

  /// Setting up a route.
  Map<String, RouteConfig> get routes;

  /// Page when a route name is specified that is not defined in the route.
  RouteConfig get onUnknownRoute;

  /// Creating a body.
  ///
  /// [context]: Build context.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navigator.maybePop();
        return false;
      },
      child: Navigator(
          key: _navigatorKey,
          initialRoute: initialRoute,
          onGenerateRoute: (settings) => RouteConfig._onGenerateRoute(settings),
          onGenerateInitialRoutes: (state, initialRouteName) {
            return [
              UIPageRoute(
                builder: routes.containsKey(initialRouteName)
                    ? routes[initialRouteName]!.builder
                    : onUnknownRoute.builder,
                settings: RouteSettings(
                  name: initialRouteName,
                  arguments: ModalRoute.of(context)?.settings.arguments,
                ),
              ),
            ];
          },
          onUnknownRoute: (settings) =>
              RouteConfig._onSingleRoute(settings, onUnknownRoute)),
    );
  }
}
