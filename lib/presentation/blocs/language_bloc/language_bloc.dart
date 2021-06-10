import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_translation/flutter_translation.dart';
import 'package:githubapp/core/language/app_languages.dart';
import 'package:githubapp/domain/entities/no_params.dart';
import 'package:githubapp/domain/use_cases/get_language.dart';
import 'package:githubapp/domain/use_cases/save_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({required this.getLanguage, required this.saveLanguage})
      : super(
            LanguageState(language: AppLanguages.singleton().defaultLanguage));

  final GetLanguage getLanguage;
  final SaveLanguage saveLanguage;

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is LoadLanguage) {
      final failureOrLanguage = await getLanguage(NoParams());
      yield failureOrLanguage.fold(
          (failure) => state.copyWith(language: state.language),
          (code) => state.copyWith(
              language: AppLanguages.singleton().findByCode(code)));
    } else if (event is ChangeLanguage) {
      final failureOrLanguage = await saveLanguage(
          SaveLanguageParams(languageCode: event.languageEntity.code));
      yield failureOrLanguage.fold(
          (failure) => state.copyWith(language: state.language),
          (code) => state.copyWith(
              language: AppLanguages.singleton().findByCode(code)));
    }
  }
}
