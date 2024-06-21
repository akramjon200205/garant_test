import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';

abstract class TestDataSource {
  Future<TestModel> getTest();
}

class TestDataSourceImpl implements TestDataSource {
  Dio dio;
  TestDataSourceImpl({required this.dio});
  @override
  Future<TestModel> getTest() async {
    final result = await dio.request('');
    TestModel list = TestModel.fromJson(result.data);
    log("$list");
    return list;
  }
}
