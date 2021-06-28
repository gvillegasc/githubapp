import 'package:dartz/dartz.dart';
import 'package:githubapp/core/error/failures.dart';

abstract class LanguageRepository {
  Future<Either<Failure, String>> saveLanguage(String languageCode);
  Future<Either<Failure, String>> getLanguage();
}
