import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:githubapp/core/language/app_languages.dart';
import 'package:githubapp/core/language/app_locations.dart';
import 'package:githubapp/core/language/translator/app_translator.dart';
import 'package:githubapp/data/data_sources/local_data_source.dart';
import 'package:githubapp/data/repositories/language_repository_impl.dart';
import 'package:githubapp/domain/repositories/language_repository.dart';
import 'package:githubapp/domain/use_cases/get_language.dart';
import 'package:githubapp/domain/use_cases/save_language.dart';
import 'package:githubapp/presentation/blocs/commit_bloc/commit_bloc.dart';
import 'package:githubapp/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:githubapp/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:githubapp/data/data_sources/remote_data_source.dart';
import 'package:githubapp/data/repositories/commit_repository_impl.dart';
import 'package:githubapp/domain/repositories/commit_repository.dart';
import 'package:githubapp/domain/use_cases/get_commits.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Blocs
  getIt.registerLazySingleton(
    () => CommitBloc(
      getCommits: getIt<GetCommits>(),
    ),
  );
  getIt.registerLazySingleton<LanguageBloc>(
    () => LanguageBloc(
      getLanguage: getIt<GetLanguage>(),
      saveLanguage: getIt<SaveLanguage>(),
    ),
  );
  getIt.registerLazySingleton<ThemeBloc>(
    () => ThemeBloc(),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCommits(getIt<CommitRepository>()));
  getIt.registerLazySingleton(() => GetLanguage(getIt<LanguageRepository>()));
  getIt.registerLazySingleton(() => SaveLanguage(getIt<LanguageRepository>()));

  // Repository
  getIt.registerLazySingleton<CommitRepository>(
    () => CommitRepositoryImpl(remoteDataSource: getIt<RemoteDataSource>()),
  );
  getIt.registerLazySingleton<LanguageRepository>(
    () => LanguageRepositoryImpl(localDataSource: getIt<LocalDataSource>()),
  );

  // Datasource
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sharedPreferences: getIt()),
  );

  // External
  getIt.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  //Language
  getIt.registerSingleton<AppLanguages>(AppLanguages.singleton());
  getIt.registerFactoryParam<AppTranslator, BuildContext, Object>(
    (context, nullParam) =>
        Localizations.of(context!, AppLocalizations).translator,
  );
}
