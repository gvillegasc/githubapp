import 'package:get_it/get_it.dart';
import 'package:githubapp/presentation/blocs/commit_bloc/commit_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:githubapp/data/data_sources/remote_data_source.dart';
import 'package:githubapp/data/repository/commit_repository_impl.dart';
import 'package:githubapp/domain/repository/commit_repository.dart';
import 'package:githubapp/domain/use_cases/get_commits.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Blocs
  getIt.registerFactory(
    () => CommitBloc(
      getCommits: getIt<GetCommits>(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCommits(getIt<CommitRepository>()));

  // Repository
  getIt.registerLazySingleton<CommitRepository>(
    () => CommitRepositoryImpl(remoteDataSource: getIt<RemoteDataSource>()),
  );

  // Datasource
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: getIt()),
  );

  // External
  getIt.registerLazySingleton(() => http.Client());
}
