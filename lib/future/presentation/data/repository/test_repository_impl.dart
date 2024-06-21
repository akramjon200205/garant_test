import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_garant/future/common/error/exeption.dart';
import 'package:test_garant/future/common/error/failure.dart';
import 'package:test_garant/future/common/platform/network_info.dart';
import 'package:test_garant/future/presentation/data/datasource/test_datasource.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';
import 'package:test_garant/future/presentation/data/repository/test_repository.dart';

class TestRepositoryImpl implements TestRepository {
  final TestDataSource testDataSource;
  final NetworkInfo networkInfo;

  TestRepositoryImpl({required this.testDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, TestModel>> getTestModel() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await testDataSource.getTest();
        return Right(result);
      } on DioException catch (e) {
        final failure = DioExceptions.fromDioError(e);
        return Left(failure);
      }
    } else {
      return const Left(
        ConnectionFailure("Exeption"),
      );
    }
  }
}
