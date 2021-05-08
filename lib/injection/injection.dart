import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:githubapp/data/data_source/remote_data_source.dart';
import 'package:githubapp/data/repository/github_repository_impl.dart';
import 'package:githubapp/domain/repository/github_repository.dart';
import 'package:githubapp/domain/usecases/get_commits.dart';
import 'package:githubapp/presentation/blocs/commit_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => CommitBloc(
      getCommits: sl<GetCommits>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCommits(sl<GithubRepository>()));

  // Repository
  sl.registerLazySingleton<GithubRepository>(
    () => GithubRepositoryImpl(remoteDataSource: sl<RemoteDataSource>()),
  );

  // Datasource
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
