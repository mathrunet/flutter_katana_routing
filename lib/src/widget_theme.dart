part of katana_routing;

/// Set the theme for the widget.
///
/// If you pass the theme data to [UIMaterialApp],
/// it will be used internally as the default for various widgets.
class WidgetTheme {
  /// Set the theme for the widget.
  ///
  /// If you pass the theme data to [UIMaterialApp],
  /// it will be used internally as the default for various widgets.
  const WidgetTheme({
    this.loadingIndicator = _loadingIndicator,
  });

  /// Get WidgetTheme.
  ///
  /// You can check the current widget setting.
  static WidgetTheme of(BuildContext context) {
    return (context
            .getElementForInheritedWidgetOfExactType<WidgetThemeScope>()!
            .widget as WidgetThemeScope)
        .widgetTheme;
  }

  /// Loading indicator.
  final Widget Function(BuildContext context, Color? color)? loadingIndicator;

  static Widget _loadingIndicator(BuildContext context, Color? color) {
    return const CircularProgressIndicator();
  }
}
