import 'package:dartz/dartz.dart';
import 'package:test_garant/future/common/error/failure.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';

abstract class TestRepository {
  Future<Either<Failure, TestModel>> getTestModel();
}
