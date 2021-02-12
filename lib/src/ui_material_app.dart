part of katana_routing;

/// Widget which extended [MaterialApp] for Path.
class UIMaterialApp extends StatelessWidget {
  /// Widget which extended [MaterialApp] for Path.
  const UIMaterialApp({
    Key? key,
    this.widgetTheme = const WidgetTheme(),
    this.flavor = "",
    this.home,
    this.navigatorKey,
    this.routes = const <String, RouteConfig>{},
    this.initialRoute = "/",
    this.navigatorObservers = const <NavigatorObserver>[],
    this.title = "",
    this.onGenerateTitle,
    this.onUnknownRoute,
    this.onBootRoute,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
  }) : super(key: key);

  final String flavor;
  final WidgetBuilder? home;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Map<String, RouteConfig> routes;
  final String initialRoute;
  final List<NavigatorObserver> navigatorObservers;
  final String title;
  final RouteFactory? onGenerateTitle;
  final RouteConfig? onUnknownRoute;
  final RouteConfig? onBootRoute;
  final Color? color;
  final ThemeColor? theme;
  final ThemeColor? darkTheme;
  final ThemeMode themeMode;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
      localeListResolutionCallback;
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final WidgetTheme widgetTheme;

  @override
  Widget build(BuildContext context) {
    Config.initialize();
    RouteConfig._initialize(routes);
    return ProviderScope(
      child: FlavorScope(
        flavor: flavor,
        child: WidgetThemeScope(
          widgetTheme: widgetTheme,
          child: MaterialApp(
            key: key,
            navigatorKey: navigatorKey,
            initialRoute: initialRoute,
            home: home?.call(context),
            onGenerateRoute: home != null
                ? null
                : (settings) => RouteConfig._onGenerateRoute(settings),
            onGenerateInitialRoutes: home != null
                ? null
                : (initialRouteName) => RouteConfig._onGenerateInitialRoute(
                    initialRouteName,
                    boot: onBootRoute),
            navigatorObservers: [
              ...navigatorObservers,
            ],
            builder: null,
            title: title,
            onUnknownRoute: onUnknownRoute == null
                ? null
                : (settings) =>
                    RouteConfig._onSingleRoute(settings, onUnknownRoute!),
            color: color,
            theme: theme?.toThemeData(),
            darkTheme: darkTheme?.toThemeData(),
            themeMode: themeMode,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            debugShowMaterialGrid: debugShowMaterialGrid,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          ),
        ),
      ),
    );
  }
}

/// Widget to get the flavor.
///
/// You can get the widget with [FlavorScope.of(context)].
class FlavorScope extends InheritedWidget {
  /// Widget to get the flavor.
  ///
  /// You can get the widget with [FlavorScope.of(context)].
  ///
  /// [key]: Key.
  /// [flavor]: Flavor.
  /// [child]: Child widget.
  const FlavorScope({
    Key? key,
    required this.flavor,
    required Widget child,
  }) : super(key: key, child: child);

  /// Get FlavorScope.
  ///
  /// You can check the current Flavor setting.
  static FlavorScope of(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<FlavorScope>()!
        .widget as FlavorScope;
  }

  /// Flavor.
  final String flavor;

  /// True to build on update.
  ///
  /// [oldWidget]: Previous widget.
  @override
  bool updateShouldNotify(FlavorScope oldWidget) {
    return true;
  }
}

/// Widget to get the widget theme.
///
/// You can get the widget with [WidgetThemeScope.of(context)].
class WidgetThemeScope extends InheritedWidget {
  /// Widget to get the whdget theme.
  ///
  /// You can get the widget with [WidgetThemeScope.of(context)].
  ///
  /// [key]: Key.
  /// [widgetTheme]: Widget theme.
  /// [child]: Child widget.
  const WidgetThemeScope({
    Key? key,
    required this.widgetTheme,
    required Widget child,
  }) : super(key: key, child: child);

  /// Get WidgetThemeScope.
  ///
  /// You can check the current whdget theme setting.
  static WidgetThemeScope of(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<WidgetThemeScope>()!
        .widget as WidgetThemeScope;
  }

  /// Widget theme.
  final WidgetTheme widgetTheme;

  /// True to build on update.
  ///
  /// [oldWidget]: Previous widget.
  @override
  bool updateShouldNotify(FlavorScope oldWidget) {
    return true;
  }
}
