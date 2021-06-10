part of 'theme_bloc.dart';

@immutable
class ThemeState {
  const ThemeState({
    this.isDark = true,
  });

  final bool isDark;

  ThemeState copyWith({bool isDark = true}) => ThemeState(
        isDark: isDark,
      );
}
