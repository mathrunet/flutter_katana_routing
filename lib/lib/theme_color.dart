part of katana_routing;

/// Color definition for the theme.
class ThemeColor {
  /// Color definition for the theme.
  const ThemeColor({
    this.primary = Colors.blue,
    this.secondary = Colors.cyan,
    this.primaryVariant = Colors.blueAccent,
    this.secondaryVariant = Colors.cyanAccent,
    this.disabled = Colors.grey,
    this.weak = Colors.grey,
    this.error = Colors.red,
    this.warning = Colors.amber,
    this.info = Colors.blue,
    this.success = Colors.green,
    this.surface = Colors.white,
    this.background = Colors.white,
    this.onPrimary = Colors.white,
    this.onSecondary = Colors.white,
    this.onDisabled = Colors.white,
    this.onSurface = Colors.white,
    this.onBackground = Colors.black,
    this.onWeak = Colors.white,
    this.onError = Colors.white,
    this.onInfo = Colors.white,
    this.onSuccess = Colors.black,
    this.onWarning = Colors.white,
    this.brightness = Brightness.light,
  });

  /// Color definition for the theme.
  factory ThemeColor.light(
          {Color primary = Colors.blue,
          Color secondary = Colors.cyan,
          Color primaryVariant = Colors.blueAccent,
          Color secondaryVariant = Colors.cyanAccent,
          Color disabled = Colors.grey,
          Color weak = Colors.grey,
          Color error = Colors.red,
          Color warning = Colors.amber,
          Color info = Colors.blue,
          Color success = Colors.green,
          Color surface = Colors.white,
          Color background = Colors.white,
          Color onPrimary = Colors.white,
          Color onSecondary = Colors.white,
          Color onDisabled = Colors.white,
          Color onSurface = Colors.black,
          Color onBackground = Colors.black,
          Color onWeak = Colors.white,
          Color onError = Colors.white,
          Color onInfo = Colors.white,
          Color onSuccess = Colors.white,
          Color onWarning = Colors.white}) =>
      ThemeColor(
        primary: primary,
        secondary: secondary,
        primaryVariant: primaryVariant,
        secondaryVariant: secondaryVariant,
        disabled: disabled,
        weak: weak,
        error: error,
        warning: warning,
        info: info,
        success: success,
        surface: surface,
        background: background,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onDisabled: onDisabled,
        onSurface: onSurface,
        onBackground: onBackground,
        onWeak: onWeak,
        onError: onError,
        onInfo: onInfo,
        onSuccess: onSuccess,
        onWarning: onWarning,
        brightness: Brightness.light,
      );

  /// Color definition for the theme.
  factory ThemeColor.dark(
          {Color primary = Colors.blue,
          Color secondary = Colors.cyan,
          Color primaryVariant = Colors.blueAccent,
          Color secondaryVariant = Colors.cyanAccent,
          Color disabled = Colors.grey,
          Color weak = Colors.grey,
          Color error = Colors.red,
          Color warning = Colors.amber,
          Color info = Colors.blue,
          Color success = Colors.green,
          Color surface = Colors.black12,
          Color background = Colors.black26,
          Color onPrimary = Colors.white,
          Color onSecondary = Colors.white,
          Color onDisabled = Colors.white,
          Color onSurface = Colors.white,
          Color onBackground = Colors.white,
          Color onWeak = Colors.white,
          Color onError = Colors.white,
          Color onInfo = Colors.white,
          Color onSuccess = Colors.white,
          Color onWarning = Colors.white}) =>
      ThemeColor(
        primary: primary,
        secondary: secondary,
        primaryVariant: primaryVariant,
        secondaryVariant: secondaryVariant,
        disabled: disabled,
        weak: weak,
        error: error,
        warning: warning,
        info: info,
        success: success,
        surface: surface,
        background: background,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onDisabled: onDisabled,
        onSurface: onSurface,
        onBackground: onBackground,
        onWeak: onWeak,
        onError: onError,
        onInfo: onInfo,
        onSuccess: onSuccess,
        onWarning: onWarning,
        brightness: Brightness.dark,
      );

  /// Primary color.
  final Color primary;

  /// Secondary color.
  final Color secondary;

  /// Primary color variant.
  final Color primaryVariant;

  /// Secondary color variant.
  final Color secondaryVariant;

  /// The color when disabled.
  final Color disabled;

  /// The color of the outside line and the dividing line.
  final Color weak;

  /// Error color.
  final Color error;

  /// Attention color.
  final Color warning;

  /// Information color.
  final Color info;

  /// Color when successful.
  final Color success;

  /// Background color of dialogs, etc.
  final Color surface;

  /// Background color.
  final Color background;

  /// Primary color text color.
  final Color onPrimary;

  /// Secondary color text color.
  final Color onSecondary;

  /// Invalid text color.
  final Color onDisabled;

  /// Character color of the surface.
  final Color onSurface;

  /// Text color for the background color.
  final Color onBackground;

  /// Text color for lines.
  final Color onWeak;

  /// Text color for errors.
  final Color onError;

  /// Text color for information.
  final Color onInfo;

  /// Text color for success color.
  final Color onSuccess;

  /// Text color for attention color.
  final Color onWarning;

  /// Brightness.
  final Brightness brightness;

  /// Conversion to theme data.
  ThemeData toThemeData() {
    switch (brightness) {
      case Brightness.dark:
        final colorScheme = const ColorScheme.dark().copyWith(
          primary: primary,
          primaryVariant: primaryVariant,
          secondary: secondary,
          secondaryVariant: secondaryVariant,
          surface: surface,
          background: background,
          error: error,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          onBackground: onBackground,
          onSurface: onSurface,
          onError: onError,
          brightness: brightness,
        );
        return ThemeData.dark().copyWith(
          platform: TargetPlatform.iOS,
          colorScheme: colorScheme,
          buttonColor: primary,
          textTheme: ThemeData.light().textTheme.apply(
                bodyColor: onBackground,
                displayColor: onBackground,
              ),
          buttonTheme: ThemeData.dark().buttonTheme.copyWith(
                textTheme: ThemeData.dark().buttonTheme.textTheme,
                buttonColor: primary,
                disabledColor: disabled,
                colorScheme: colorScheme,
              ),
          inputDecorationTheme: ThemeData.dark().inputDecorationTheme.copyWith(
                labelStyle: TextStyle(color: weak),
                helperStyle: TextStyle(color: weak),
                hintStyle: TextStyle(color: weak),
                counterStyle: TextStyle(color: weak),
                errorStyle: TextStyle(color: error),
                prefixStyle: TextStyle(color: onBackground),
                suffixStyle: TextStyle(color: onBackground),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: weak, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: weak, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: weak, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: error, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: error, width: 2),
                ),
              ),
          indicatorColor: secondary,
          brightness: brightness,
          primaryColorBrightness: brightness,
          primaryColor: primary,
          accentColor: secondary,
          disabledColor: disabled,
          dividerColor: weak,
          errorColor: error,
          backgroundColor: background,
          canvasColor: background,
        );
      default:
        final colorScheme = const ColorScheme.light().copyWith(
            primary: primary,
            primaryVariant: primaryVariant,
            secondary: secondary,
            secondaryVariant: secondaryVariant,
            surface: surface,
            background: background,
            error: error,
            onPrimary: onPrimary,
            onSecondary: onSecondary,
            onBackground: onBackground,
            onSurface: onSurface,
            onError: onError,
            brightness: brightness);
        return ThemeData.light().copyWith(
          platform: TargetPlatform.iOS,
          colorScheme: colorScheme,
          buttonColor: primary,
          textTheme: ThemeData.light()
              .textTheme
              .apply(bodyColor: onBackground, displayColor: onBackground),
          buttonTheme: ThemeData.light().buttonTheme.copyWith(
              buttonColor: primary,
              disabledColor: disabled,
              colorScheme: colorScheme),
          inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
                labelStyle: TextStyle(color: weak),
                helperStyle: TextStyle(color: weak),
                hintStyle: TextStyle(color: weak),
                counterStyle: TextStyle(color: weak),
                errorStyle: TextStyle(color: error),
                prefixStyle: TextStyle(color: onBackground),
                suffixStyle: TextStyle(color: onBackground),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: weak, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: weak, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: weak, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: error, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: error, width: 2),
                ),
              ),
          indicatorColor: secondary,
          brightness: brightness,
          primaryColorBrightness: brightness,
          primaryColor: primary,
          accentColor: secondary,
          disabledColor: disabled,
          dividerColor: weak,
          errorColor: error,
          backgroundColor: background,
          canvasColor: background,
        );
    }
  }
}
