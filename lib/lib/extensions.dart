part of katana_routing;

/// NavigatorState extension methods.
extension NavigatorStateExtensions on NavigatorState {
  /// Pops the page to the page with the specified path.
  ///
  /// [name]: Page path.
  Future<void> popUntilNamed(String name) async {
    popUntil((route) {
      return route.settings.name == name;
    });
  }

  /// Reset all history and go to a specific page.
  ///
  /// Ideal for moving after logging out.
  ///
  /// [newRouteName]: New root path.
  /// [arguments]: An array to pass to the new page.
  Future<T?> resetAndPushNamed<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) {
    return pushNamedAndRemoveUntil(
      newRouteName,
      (route) => false,
      arguments: arguments,
    );
  }
}

extension BuildContextExtensions on BuildContext {
  /// Updates the content of the widget.
  void refresh() {
    UIPage.of(this).refresh();
  }

  /// Outputs the theme related to the context.
  ThemeData get theme => Theme.of(this);

  /// Outputs the widget theme related to the context.
  WidgetTheme get widgetTheme => WidgetTheme.of(this);

  /// Get the Navigator related to context.
  NavigatorState get navigator => Navigator.of(this);

  /// Get the Root navigator related to context.
  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: true);

  /// Get the Flavor.
  String get flavor => FlavorScope.of(this).flavor;

  /// Get the data passed to the page.
  Map<String, dynamic> get arg =>
      ModalRoute.of(this)?.settings.arguments as Map<String, dynamic>? ??
      const <String, dynamic>{};

  /// Get the media qury related to context
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Releases focus such as text field.
  void unfocus() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}
