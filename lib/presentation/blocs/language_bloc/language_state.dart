part of 'language_bloc.dart';

// abstract class LanguageState extends Equatable {
//   const LanguageState();

//   @override
//   List<Object> get props => [];
// }

// class LanguageInitial extends LanguageState {}

class LanguageState {
  LanguageState({
    required this.language,
  });
  LanguageEntity language;

  LanguageState copyWith({required LanguageEntity language}) => LanguageState(
        language: language,
      );
}
