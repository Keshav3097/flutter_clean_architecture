part of 'index.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    return FlexThemeData.light(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      appBarBackground: const Color(0xff3535F3),
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
        keepSecondary: true,
        keepTertiary: true,
        keepPrimaryContainer: true,
        keepSecondaryContainer: true,
        keepTertiaryContainer: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //useMaterial3: true,
      // To use the playground font, add GoogleFonts package and uncomment
      fontFamily: 'JioType',
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return FlexThemeData.dark(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //useMaterial3: true,
      // To use the playground font, add GoogleFonts package and uncomment
      fontFamily: 'JioType',
    );
  }
}