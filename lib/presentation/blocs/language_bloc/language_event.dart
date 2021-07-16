part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class OnGetLanguage extends LanguageEvent {}

class OnSaveLanguage extends LanguageEvent {
  const OnSaveLanguage(this.languageEntity);

  final LanguageEntity languageEntity;
}
