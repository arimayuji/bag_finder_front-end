

import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    splashColor: Colors.transparent,
    shadowColor: AppColors.primaryGreen,
    fontFamily: GoogleFonts.poppins().fontFamily,
    dividerColor: AppColors.primaryGreen,
    dividerTheme: DividerThemeData(
      color: AppColors.primaryGreen,
      thickness: AppDimensions.borderMedium,
      indent: 5,
      endIndent: 5,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
      elevation: WidgetStatePropertyAll(8),
      shape: WidgetStatePropertyAll(StadiumBorder()),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          vertical: AppDimensions.paddingLarge,
          horizontal: AppDimensions.paddingExtraLarge,
        ),
      ),
    )),
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryGreen;
        }
        return Colors.grey;
      }),
    ),
    dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
        ),
        alignment: AlignmentDirectional.center,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display,
      headlineLarge: AppTextStyles.headline,
      titleMedium: AppTextStyles.titleMedium,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryGreen, width: 1.2),
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusSmall,
        ),
      ),
      color: AppColors.white,
      elevation: 8,
      shadowColor: AppColors.primaryGreen,
      surfaceTintColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.titleMedium,
      hintStyle: AppTextStyles.titleMedium.copyWith(color: AppColors.gray),
      contentPadding: const EdgeInsets.only(
        left: AppDimensions.paddingMedium,
        right: AppDimensions.paddingMedium,
        top: AppDimensions.paddingExtraLarge,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        gapPadding: AppDimensions.paddingSmall,
        borderSide: BorderSide(
            color: AppColors.primaryGreen,
            width: AppDimensions.borderThin * 1.5,
            style: BorderStyle.solid),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        gapPadding: AppDimensions.paddingSmall,
        borderSide: BorderSide(
            color: AppColors.primaryGreen,
            width: AppDimensions.borderThin * 1.5,
            style: BorderStyle.solid),
      ),
      floatingLabelStyle: AppTextStyles.headline,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        gapPadding: AppDimensions.paddingSmall,
        borderSide: BorderSide(
            color: AppColors.primaryGreen,
            width: AppDimensions.borderThin * 1.5,
            style: BorderStyle.solid),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryGreen,
      size: AppDimensions.iconLarge,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(
          AppColors.primaryGreen,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryGreen,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryGreen,
      onPrimary: AppColors.primaryGreen,
      secondary: AppColors.white,
      onSecondary: AppColors.white,
      error: AppColors.red,
      shadow: AppColors.primaryGreen,
      onError: AppColors.red,
      surface: AppColors.white,
      onSurface: AppColors.white,
    ),
  );

  static final darkTheme = ThemeData(
      iconTheme: IconThemeData(color: AppColors.primaryGreen),
      shadowColor: AppColors.primaryGreen,
      scaffoldBackgroundColor: AppColors.primaryGreen,
      cardTheme: CardTheme(
        color: AppColors.primaryGreen,
        elevation: 4,
        shadowColor: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.white, style: BorderStyle.solid),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: WidgetStateProperty.all(AppColors.primaryGreen))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.white,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryGreen),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryGreen,
        onPrimary: AppColors.primaryGreen,
        secondary: AppColors.white,
        onSecondary: AppColors.white,
        error: AppColors.red,
        shadow: AppColors.primaryGreen,
        onError: AppColors.red,
        surface: AppColors.white,
        onSurface: AppColors.white,
      ));
}