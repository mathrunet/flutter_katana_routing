part of katana_routing;

/// Define a query for routing.
///
/// You can pass it as [arguments] with [pageNamed()] and so on.
class RouteQuery {
  /// Define a query for routing.
  ///
  /// You can pass it as [arguments] with [pageNamed()] and so on.
  ///
  /// [transition]: True when transitioning type.
  /// [document]: Document for routing.
  /// [data]: Data for routing.
  const RouteQuery(
      {PageTransition transition = PageTransition.initial,
      Map<String, dynamic> parameters = const {}})
      : _transition = transition,
        _parameters = parameters;

  final PageTransition _transition;
  final Map<String, dynamic> _parameters;

  RouteQuery copyWith(
      {PageTransition? transition, Map<String, dynamic>? parameters}) {
    return RouteQuery(
      transition: transition ?? _transition,
      parameters: parameters ?? _parameters,
    );
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => _parameters.hashCode;

  @override
  String toString() => "${describeIdentity(this)}($_transition, $_parameters)";

  /// View the page as a full screen.
  static RouteQuery get fullscreen =>
      const RouteQuery(transition: PageTransition.fullscreen);

  /// Display the page with no animation.
  static RouteQuery get immediately =>
      const RouteQuery(transition: PageTransition.none);

  /// Display the page with fade animation.
  static RouteQuery get fade =>
      const RouteQuery(transition: PageTransition.fade);
}

/// Types of page transitions.
enum PageTransition {
  /// Normal.
  initial,

  /// No animation.
  none,

  /// Full Screen.
  fullscreen,

  /// Fade animation.
  fade
}
