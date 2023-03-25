
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:sparky/core/helper/app_color.dart';
import 'package:sparky/core/helper/app_texts.dart';

/// Generate Adwaita light and dark theme.
class ThemeApp {
  const ThemeApp._();

  static final _lightColorScheme = ColorScheme.fromSwatch(
    // NOTE(robert-ancell): Light shades from 'Tint' on website, dark shades
    // calculated.
    primarySwatch: AppColors.primarySwatchColor,
    primaryColorDark: AppColors.darkBackgroundColor,
    accentColor: AppColors.blueAccent,
    cardColor: AppColors.cardBackground,
    backgroundColor: AppColors.backgroundColor,
    errorColor: AppColors.red5,
  );

  static final _darkColorScheme = ColorScheme.fromSwatch(
    // NOTE(robert-ancell): Light shades from 'Tint' on website, dark shades
    // calculated.
    primarySwatch: AppColors.primarySwatchColor,
    primaryColorDark: AppColors.darkBackgroundColor,
    accentColor: AppColors.blueAccent,
    cardColor: AppColors.darkCardBackground,
    backgroundColor: AppColors.darkBackgroundColor,
    errorColor: AppColors.red5,
    brightness: Brightness.dark,
  );

  static ShapeBorder getDialogShape([Color color = Colors.white]) =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: color.withOpacity(0.2)),
      );

  static TextTheme getTextTheme([Brightness brightness = Brightness.light]) {
    final color = brightness == Brightness.light ? Colors.black54 : Colors.white70;
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        color: color,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 21,
        color: color,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: color,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 17,
        color: color,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 15,
        color: color,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        color: color,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// A default light theme.
  static ThemeData light({String? fontFamily=AppTexts.appFontFamily}) => ThemeData(
    fontFamily: fontFamily,
    tabBarTheme: TabBarTheme(labelColor: _lightColorScheme.onSurface),
    brightness: Brightness.light,
    splashFactory: NoSplash.splashFactory,
    primaryColor: _lightColorScheme.primary,
    canvasColor: _lightColorScheme.background,
    scaffoldBackgroundColor: _lightColorScheme.background,
    cardColor: _lightColorScheme.surface,
    dividerColor: _lightColorScheme.onSurface.withOpacity(0.12),
    dialogBackgroundColor: _lightColorScheme.background,
    dialogTheme: DialogTheme(
      backgroundColor: _lightColorScheme.background,
      shape: getDialogShape(Colors.black),
    ),
    textTheme: getTextTheme(),
    indicatorColor: _lightColorScheme.secondary,
    applyElevationOverlayColor: false,
    buttonTheme: _buttonThemeData,
    elevatedButtonTheme: _getElevatedButtonThemeData(Brightness.light),
    outlinedButtonTheme: _outlinedButtonThemeData,
    textButtonTheme: _textButtonThemeData,
    switchTheme: _switchStyleLight,
    checkboxTheme: _checkStyleLight,
    radioTheme: _radioStyleLight,
    appBarTheme: _appBarLightTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blueAccent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: _lightColorScheme.primary,
      unselectedItemColor: AppColors.dark3,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.light2,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.blueAccent,
        ),
      ),
    ), bottomAppBarTheme: BottomAppBarTheme(color: _lightColorScheme.surface), colorScheme: _lightColorScheme.copyWith(background: _lightColorScheme.background).copyWith(error: _lightColorScheme.error),
  );

  /// A default dark theme.
  static ThemeData dark({String? fontFamily=AppTexts.appFontFamily}) => ThemeData(

    fontFamily: fontFamily,
    tabBarTheme: TabBarTheme(labelColor: _darkColorScheme.onBackground),
    brightness: Brightness.dark,
    splashFactory: NoSplash.splashFactory,
    primaryColor: _darkColorScheme.primary,
    canvasColor: _darkColorScheme.background,
    scaffoldBackgroundColor: _darkColorScheme.background,
    cardColor: _darkColorScheme.surface,
    dividerColor: _darkColorScheme.onSurface.withOpacity(0.12),
    dialogBackgroundColor: _darkColorScheme.background,
    dialogTheme: DialogTheme(
      backgroundColor: _darkColorScheme.background,
      shape: getDialogShape(),
    ),
    textTheme: getTextTheme(Brightness.dark),
    indicatorColor: _darkColorScheme.secondary,
    applyElevationOverlayColor: true,
    buttonTheme: _buttonThemeData,
    textButtonTheme: _darkTextButtonThemeData,
    elevatedButtonTheme: _getElevatedButtonThemeData(Brightness.dark),
    outlinedButtonTheme: _darkOutlinedButtonThemeData,
    switchTheme: _switchStyleDark,
    checkboxTheme: _checkStyleDark,
    radioTheme: _radioStyleDark,
    primaryColorDark: AppColors.blueAccent,
    appBarTheme: _appBarDarkTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blueAccent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: _darkColorScheme.primary,
      unselectedItemColor: AppColors.warmGrey.shade300,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkButton,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(color: AppColors.blueAccent),
      ),
    ), colorScheme: _darkColorScheme.copyWith(error: _darkColorScheme.error).copyWith(background: _darkColorScheme.background), bottomAppBarTheme: BottomAppBarTheme(color: _darkColorScheme.surface),
  );

  // Special casing some widgets to get the desired Adwaita look
  // Buttons

  static final _commonButtonStyle = ButtonStyle(
    visualDensity: VisualDensity.standard,
    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.light4;
      }
      return AppColors.light2; // Use the component's default.
    }),
  );

  static final _darkCommonButtonStyle = ButtonStyle(
    visualDensity: VisualDensity.standard,
    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.dark5;
      }
      return AppColors.dark2; // Use the component's default.
    }),
  );

  static final _buttonThemeData = ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  static final _outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.dark4, visualDensity: _commonButtonStyle.visualDensity,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
  );

  static final _darkOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white, visualDensity: _commonButtonStyle.visualDensity,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: Colors.black.withOpacity(0.75)),
      ),
    ),
  );

  static final _textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.dark4, visualDensity: _commonButtonStyle.visualDensity,
      backgroundColor: AppColors.button,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.transparent),
      ),
    ),
  );

  static final _darkTextButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, visualDensity: _darkCommonButtonStyle.visualDensity,
      backgroundColor: AppColors.darkButton,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.transparent),
      ),
    ),
  );

  static ElevatedButtonThemeData _getElevatedButtonThemeData(
      Brightness brightness,
      ) {
    if (brightness == Brightness.light) {
      return ElevatedButtonThemeData(style: _commonButtonStyle);
    }
    return ElevatedButtonThemeData(style: _darkCommonButtonStyle);
  }

// Switches
  static Color _getSwitchThumbColorDark(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AppColors.dark2;
    } else {
      if (states.contains(MaterialState.selected)) {
        return AppColors.blueAccent;
      } else {
        return AppColors.warmGrey;
      }
    }
  }

  static Color _getSwitchTrackColorDark(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AppColors.dark2.withAlpha(120);
    } else {
      if (states.contains(MaterialState.selected)) {
        return AppColors.blueAccent.withAlpha(160);
      } else {
        return AppColors.warmGrey.withAlpha(80);
      }
    }
  }

  static final _switchStyleDark = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColorDark),
    trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColorDark),
  );

  static Color _getSwitchThumbColorLight(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AppColors.warmGrey.shade200;
    } else {
      if (states.contains(MaterialState.selected)) {
        return AppColors.blueAccent;
      } else {
        return Colors.white;
      }
    }
  }

  static Color _getSwitchTrackColorLight(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AppColors.warmGrey.shade200;
    } else {
      if (states.contains(MaterialState.selected)) {
        return AppColors.blueAccent.withAlpha(180);
      } else {
        return AppColors.warmGrey.shade300;
      }
    }
  }

  static final _switchStyleLight = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColorLight),
    trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColorLight),
  );

// Checks
  static Color _getCheckFillColorDark(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.blueAccent;
      }
      return AppColors.warmGrey.shade400;
    }
    return AppColors.warmGrey.withOpacity(0.4);
  }

  static Color _getCheckColorDark(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      return Colors.white;
    }
    return AppColors.warmGrey;
  }

  static final _checkStyleDark = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorDark),
    checkColor: MaterialStateProperty.resolveWith(_getCheckColorDark),
  );

  static Color _getCheckFillColorLight(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.blueAccent;
      }
      return AppColors.warmGrey;
    }
    return AppColors.warmGrey.shade300;
  }

  static Color _getCheckColorLight(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      return Colors.white;
    }
    return AppColors.warmGrey;
  }

  static final _checkStyleLight = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorLight),
    checkColor: MaterialStateProperty.resolveWith(_getCheckColorLight),
  );

// Radios
  static final _radioStyleDark = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorDark),
  );

  static final _radioStyleLight = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorLight),
  );

  static final _appBarLightTheme = AppBarTheme(
    elevation: 1,
    titleTextStyle: getTextTheme().headlineSmall,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: AppColors.headerBarBackground,
    foregroundColor: AppColors.headerBarForeground,
    iconTheme: const IconThemeData(color: AppColors.dark3),
    actionsIconTheme: const IconThemeData(color: AppColors.dark3),
  );

  static final _appBarDarkTheme = AppBarTheme(
    elevation: 1,
    titleTextStyle: getTextTheme(Brightness.dark).headlineSmall,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: AppColors.darkHeaderBarBackground,
    foregroundColor: AppColors.darkHeaderBarForeground,
  );

}