import 'package:githubapp/core/error/exceptions.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:githubapp/data/data_sources/local_data_source.dart';
import 'package:githubapp/domain/repository/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  LanguageRepositoryImpl({
    required this.localDataSource,
  });

  final LocalDataSource localDataSource;

  @override
  Future<Either<Failure, String>> getLanguage() async {
    try {
      final language = await localDataSource.getLanguage();
      return Right(language);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> saveLanguage(String languageCode) async {
    try {
      final language = await localDataSource.saveLanguage(languageCode);
      return Right(language);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
