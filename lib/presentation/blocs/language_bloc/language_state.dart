part of 'language_bloc.dart';

class LanguageState {
  LanguageState({
    required this.language,
  });
  LanguageEntity language;

  LanguageState copyWith({required LanguageEntity language}) => LanguageState(
        language: language,
      );
}
