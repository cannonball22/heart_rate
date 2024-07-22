import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff005b4e),
      surfaceTint: Color(0xff006b5c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff008472),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4e625d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcfe5de),
      onSecondaryContainer: Color(0xff374a45),
      tertiary: Color(0xff5b4774),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff806b9b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff6faf7),
      onSurface: Color(0xff181d1b),
      onSurfaceVariant: Color(0xff3e4946),
      outline: Color(0xff6e7a76),
      outlineVariant: Color(0xffbdc9c5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3130),
      inversePrimary: Color(0xff74d8c3),
      primaryFixed: Color(0xff90f5df),
      onPrimaryFixed: Color(0xff00201b),
      primaryFixedDim: Color(0xff74d8c3),
      onPrimaryFixedVariant: Color(0xff005045),
      secondaryFixed: Color(0xffd1e7e0),
      onSecondaryFixed: Color(0xff0b1f1b),
      secondaryFixedDim: Color(0xffb5cbc4),
      onSecondaryFixedVariant: Color(0xff374b46),
      tertiaryFixed: Color(0xffeddcff),
      onTertiaryFixed: Color(0xff24123c),
      tertiaryFixedDim: Color(0xffd5bdf2),
      onTertiaryFixedVariant: Color(0xff513e6a),
      surfaceDim: Color(0xffd6dbd8),
      surfaceBright: Color(0xfff6faf7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5f2),
      surfaceContainer: Color(0xffeaefec),
      surfaceContainerHigh: Color(0xffe5e9e6),
      surfaceContainerHighest: Color(0xffdfe4e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004c41),
      surfaceTint: Color(0xff006b5c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff008472),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff334742),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff647973),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4d3a66),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff806b9b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6faf7),
      onSurface: Color(0xff181d1b),
      onSurfaceVariant: Color(0xff3a4542),
      outline: Color(0xff56625e),
      outlineVariant: Color(0xff717d79),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3130),
      inversePrimary: Color(0xff74d8c3),
      primaryFixed: Color(0xff008472),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00685a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff647973),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4c605b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff806b9b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff675381),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dbd8),
      surfaceBright: Color(0xfff6faf7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5f2),
      surfaceContainer: Color(0xffeaefec),
      surfaceContainerHigh: Color(0xffe5e9e6),
      surfaceContainerHighest: Color(0xffdfe4e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002821),
      surfaceTint: Color(0xff006b5c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004c41),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff122621),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff334742),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2b1943),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4d3a66),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6faf7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1b2623),
      outline: Color(0xff3a4542),
      outlineVariant: Color(0xff3a4542),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3130),
      inversePrimary: Color(0xff9afee8),
      primaryFixed: Color(0xff004c41),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00332b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff334742),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1d302c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4d3a66),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff36244e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dbd8),
      surfaceBright: Color(0xfff6faf7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5f2),
      surfaceContainer: Color(0xffeaefec),
      surfaceContainerHigh: Color(0xffe5e9e6),
      surfaceContainerHighest: Color(0xffdfe4e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff74d8c3),
      surfaceTint: Color(0xff74d8c3),
      onPrimary: Color(0xff00382f),
      primaryContainer: Color(0xff007b6a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff21342f),
      secondaryContainer: Color(0xffc3d9d2),
      onSecondaryContainer: Color(0xff30433e),
      tertiary: Color(0xffd5bdf2),
      onTertiary: Color(0xff3a2752),
      tertiaryContainer: Color(0xff796594),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1413),
      onSurface: Color(0xffdfe4e1),
      onSurfaceVariant: Color(0xffbdc9c5),
      outline: Color(0xff87938f),
      outlineVariant: Color(0xff3e4946),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4e1),
      inversePrimary: Color(0xff006b5c),
      primaryFixed: Color(0xff90f5df),
      onPrimaryFixed: Color(0xff00201b),
      primaryFixedDim: Color(0xff74d8c3),
      onPrimaryFixedVariant: Color(0xff005045),
      secondaryFixed: Color(0xffd1e7e0),
      onSecondaryFixed: Color(0xff0b1f1b),
      secondaryFixedDim: Color(0xffb5cbc4),
      onSecondaryFixedVariant: Color(0xff374b46),
      tertiaryFixed: Color(0xffeddcff),
      onTertiaryFixed: Color(0xff24123c),
      tertiaryFixedDim: Color(0xffd5bdf2),
      onTertiaryFixedVariant: Color(0xff513e6a),
      surfaceDim: Color(0xff0f1413),
      surfaceBright: Color(0xff353a38),
      surfaceContainerLowest: Color(0xff0a0f0e),
      surfaceContainerLow: Color(0xff181d1b),
      surfaceContainer: Color(0xff1b211f),
      surfaceContainerHigh: Color(0xff262b29),
      surfaceContainerHighest: Color(0xff313634),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff78dcc7),
      surfaceTint: Color(0xff74d8c3),
      onPrimary: Color(0xff001a15),
      primaryContainer: Color(0xff37a18e),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff21342f),
      secondaryContainer: Color(0xffc3d9d2),
      onSecondaryContainer: Color(0xff10231f),
      tertiary: Color(0xffd9c1f6),
      onTertiary: Color(0xff1f0c36),
      tertiaryContainer: Color(0xff9d87b9),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1413),
      onSurface: Color(0xfff7fcf9),
      onSurfaceVariant: Color(0xffc1cdc9),
      outline: Color(0xff99a6a1),
      outlineVariant: Color(0xff7a8682),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4e1),
      inversePrimary: Color(0xff005246),
      primaryFixed: Color(0xff90f5df),
      onPrimaryFixed: Color(0xff001510),
      primaryFixedDim: Color(0xff74d8c3),
      onPrimaryFixedVariant: Color(0xff003e35),
      secondaryFixed: Color(0xffd1e7e0),
      onSecondaryFixed: Color(0xff021411),
      secondaryFixedDim: Color(0xffb5cbc4),
      onSecondaryFixedVariant: Color(0xff273a35),
      tertiaryFixed: Color(0xffeddcff),
      onTertiaryFixed: Color(0xff190631),
      tertiaryFixedDim: Color(0xffd5bdf2),
      onTertiaryFixedVariant: Color(0xff402d59),
      surfaceDim: Color(0xff0f1413),
      surfaceBright: Color(0xff353a38),
      surfaceContainerLowest: Color(0xff0a0f0e),
      surfaceContainerLow: Color(0xff181d1b),
      surfaceContainer: Color(0xff1b211f),
      surfaceContainerHigh: Color(0xff262b29),
      surfaceContainerHighest: Color(0xff313634),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffecfff8),
      surfaceTint: Color(0xff74d8c3),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff78dcc7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc3d9d2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fd),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd9c1f6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1413),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff1fef9),
      outline: Color(0xffc1cdc9),
      outlineVariant: Color(0xffc1cdc9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4e1),
      inversePrimary: Color(0xff003029),
      primaryFixed: Color(0xff95f9e3),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff78dcc7),
      onPrimaryFixedVariant: Color(0xff001a15),
      secondaryFixed: Color(0xffd6ece5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbacfc9),
      onSecondaryFixedVariant: Color(0xff061a16),
      tertiaryFixed: Color(0xfff1e1ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd9c1f6),
      onTertiaryFixedVariant: Color(0xff1f0c36),
      surfaceDim: Color(0xff0f1413),
      surfaceBright: Color(0xff353a38),
      surfaceContainerLowest: Color(0xff0a0f0e),
      surfaceContainerLow: Color(0xff181d1b),
      surfaceContainer: Color(0xff1b211f),
      surfaceContainerHigh: Color(0xff262b29),
      surfaceContainerHighest: Color(0xff313634),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
