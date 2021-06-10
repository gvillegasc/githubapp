import 'package:dartz/dartz.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/entities/no_params.dart';
import 'package:githubapp/domain/repository/language_repository.dart';
import 'package:githubapp/domain/use_cases/use_case.dart';

class GetLanguage implements UseCase<String, NoParams> {
  GetLanguage(this.repository);

  final LanguageRepository repository;

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getLanguage();
  }
}
