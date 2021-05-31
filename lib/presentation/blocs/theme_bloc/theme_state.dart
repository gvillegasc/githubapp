part of 'theme_bloc.dart';

@immutable
class ThemeState {
  final bool isDark;

  ThemeState({
    this.isDark = true,
  });

  ThemeState copyWith({bool isDark = true}) => ThemeState(
        isDark: isDark,
      );
}
