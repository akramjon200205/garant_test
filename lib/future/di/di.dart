import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_garant/future/common/platform/network_info.dart';
import 'package:test_garant/future/common/platform/pretty_dio_logger.dart';
import 'package:test_garant/future/presentation/data/datasource/test_datasource.dart';
import 'package:test_garant/future/presentation/data/repository/test_repository.dart';
import 'package:test_garant/future/presentation/data/repository/test_repository_impl.dart';
import 'package:test_garant/future/presentation/test_yechish/bloc/test_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory(() => TestBloc(themesRepository: di()));
  di.registerFactory<TestRepository>(
    () => TestRepositoryImpl(
      networkInfo: di(),
      testDataSource: di(),
    ),
  );
  di.registerLazySingleton<TestDataSource>(
    () => TestDataSourceImpl(dio: di()),
  );
  final options = BaseOptions(
      baseUrl: 'https://4ccd-91-196-77-120.ngrok-free.app/api/question/index',
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        // 'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json'
      });

  Dio dio = Dio(options);

  // dio.interceptors.add();

  di.registerSingleton<Dio>(dio);

  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  di.registerLazySingleton(() => InternetConnectionChecker());
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));
}
