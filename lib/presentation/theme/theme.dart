import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';

final appThemeDark = ThemeData.dark().copyWith(
    backgroundColor: AppColors.black70,
    scaffoldBackgroundColor: AppColors.black70,
    primaryColor: AppColors.white100,
    accentColor: AppColors.grey50);

final appThemeLight = ThemeData.light().copyWith(
    backgroundColor: AppColors.white100,
    scaffoldBackgroundColor: AppColors.white70,
    primaryColor: AppColors.black100,
    accentColor: AppColors.black70);
