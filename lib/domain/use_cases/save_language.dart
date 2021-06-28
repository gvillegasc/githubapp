import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/repositories/language_repository.dart';
import 'package:githubapp/domain/use_cases/use_case.dart';

class SaveLanguage implements UseCase<String, SaveLanguageParams> {
  SaveLanguage(this.repository);

  final LanguageRepository repository;

  @override
  Future<Either<Failure, String>> call(SaveLanguageParams params) async {
    return await repository.saveLanguage(params.languageCode);
  }
}

class SaveLanguageParams extends Equatable {
  const SaveLanguageParams({required this.languageCode});

  final String languageCode;

  @override
  List<Object> get props => [languageCode];
}
