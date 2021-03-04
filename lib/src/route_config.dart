part of katana_routing;

/// Class for recording route information.
class RouteConfig {
  /// Class for recording route information.
  ///
  /// [builder]: Route builder.
  /// [fullScreen]: True to launch in full screen.
  /// [reroute]: Map for rerouting according to conditions.
  /// [transition]: Transition animation.
  /// [platform]: Route definitions by platform.
  /// [additional]: True for pages that add new elements.
  /// [parameters]: Parameter to add when switching pages.
  RouteConfig(this.builder,
      {this.fullScreen = false,
      this.parameters = const {},
      this.transition = PageTransition.initial,
      this.additional = false,
      this.reroute = const {},
      this.platform = const {}});

  /// Route builder.
  final WidgetBuilder builder;

  /// True to launch in full screen.
  final bool fullScreen;

  /// Transition animation.
  final PageTransition transition;

  /// Parameter to add when switching pages.
  final Map<String, dynamic> parameters;

  /// Route definitions by platform.
  ///
  /// By default, the route builder is set.
  final Map<RoutePlatform, WidgetBuilder> platform;

  /// True for pages that add new elements.
  final bool additional;

  /// Map for rerouting according to conditions.
  ///
  /// Enter the redirect path in [String] and enter the condition in the callback.
  ///
  /// If the condition is true, redirect.
  final Map<String, bool Function()> reroute;

  /// Regular expression for the root path.
  RegExp? _regex;

  /// Key list for the path.
  final List<String> _keys = [];

  static bool get isInitialized => _routes.isNotEmpty;
  static final RegExp _keyRegex = RegExp(r"\{([^\}]+)\}");
  static final Map<String, RouteConfig> _routes = {};
  static void _initialize(Map<String, RouteConfig> configs) {
    if (isInitialized) {
      return;
    }
    configs.forEach((key, value) {
      if (_routes.containsKey(key)) {
        return;
      }
      key = key.replaceAllMapped(_keyRegex, (match) {
        value._keys.add(match.group(1) ?? "");
        return r"([^\{\}\/]+?)";
      });
      value._regex = RegExp(r"^" + key + r"$");
      _routes[key] = value;
    });
  }

  static Route? _onSingleRoute(RouteSettings settings, RouteConfig config) {
    final map = <String, dynamic>{};
    final arguments = settings.arguments;
    if (arguments is Map<String, dynamic>) {
      map.addAll(arguments);
    } else if (arguments is RouteQuery) {
      map.addAll(arguments._parameters);
      switch (arguments._transition) {
        case PageTransition.none:
        case PageTransition.fade:
          map["transition"] = arguments._transition;
          break;
        case PageTransition.fullscreen:
          map["fullscreen"] = true;
          map["transition"] = arguments._transition;
          break;
        default:
          break;
      }
    }
    for (final reroute in config.reroute.entries) {
      if (!reroute.value.call()) {
        continue;
      }
      map["redirect_to"] = settings.name;
      return _onGenerateRoute(
        settings.copyWith(name: reroute.key, arguments: map),
      );
    }
    map["redirect_to"] = settings.name;
    return UIPageRoute(
      builder: config.builder,
      settings: settings.copyWith(name: settings.name, arguments: map),
    );
  }

  static List<Route> _onGenerateInitialRoute(
    String initialRouteName, {
    RouteConfig? boot,
  }) {
    if (boot == null) {
      return const [];
    }
    final map = <String, dynamic>{};
    map["redirect_to"] = initialRouteName;
    return [
      UIPageRoute(
        builder: boot.builder,
        settings: RouteSettings(name: initialRouteName, arguments: map),
      ),
    ];
  }

  static Route? _onGenerateRoute(
    RouteSettings settings, {
    // ignore: unused_element
    String? authenticationRoute,
    // ignore: unused_element
    bool Function(BuildContext context)? onCheckAuthentication,
  }) {
    if (_routes.isEmpty) {
      return null;
    }
    final arguments = settings.arguments;
    final name = settings.name ?? "";
    final uri = Uri.parse(name);
    final path = "/${name.trimString("/")}";
    for (final tmp in _routes.entries) {
      final match = tmp.value._regex?.firstMatch(path);
      if (match == null) {
        continue;
      }
      final map = <String, dynamic>{};
      if (arguments is Map<String, dynamic>) {
        map.addAll(arguments);
      } else if (arguments is RouteQuery) {
        map.addAll(arguments._parameters);
        switch (arguments._transition) {
          case PageTransition.none:
          case PageTransition.fade:
            map["transition"] = arguments._transition;
            break;
          case PageTransition.fullscreen:
            map["fullscreen"] = true;
            map["transition"] = arguments._transition;
            break;
          default:
            break;
        }
      }
      map.addAll(tmp.value.parameters);
      map["additional"] = tmp.value.additional;
      for (final reroute in tmp.value.reroute.entries) {
        if (!reroute.value.call()) {
          continue;
        }
        map["redirect_to"] = settings.name;
        return _onGenerateRoute(
          settings.copyWith(name: reroute.key, arguments: map),
        );
      }
      uri.queryParameters.forEach((key, value) => map[key] = value);
      for (int i = 0; i < match.groupCount; i++) {
        if (tmp.value._keys.length <= i) {
          continue;
        }
        final key = tmp.value._keys[i];
        final value = match.group(i + 1) ?? "";
        map[key] = value;
      }
      WidgetBuilder builder = tmp.value.builder;
      for (final platform in tmp.value.platform.entries) {
        switch (platform.key) {
          case RoutePlatform.web:
            if (kIsWeb) {
              builder = platform.value;
            }
            break;
          case RoutePlatform.mobile:
            if (!kIsWeb) {
              builder = platform.value;
            }
            break;
        }
      }
      return UIPageRoute(
        builder: builder,
        settings: settings.copyWith(name: settings.name, arguments: map),
        transition: _transitionType(map, tmp.value),
      );
    }
    return null;
  }

  static PageTransition _transitionType(
      Map<String, dynamic> map, RouteConfig config) {
    if (map.containsKey("fullscreen") ||
        config.fullScreen ||
        config.transition == PageTransition.fullscreen)
      return PageTransition.fullscreen;
    else if (map.get("transition", PageTransition.none) ==
            PageTransition.none ||
        config.transition == PageTransition.none)
      return PageTransition.none;
    else if (map.get("transition", PageTransition.none) ==
            PageTransition.fade ||
        config.transition == PageTransition.fade)
      return PageTransition.fade;
    else
      return PageTransition.initial;
  }
}

/// Platform definition.
enum RoutePlatform {
  /// Mobile.
  mobile,

  /// Web.
  web,

  /// Android.
  // android,

  /// IOS
  // ios
}
