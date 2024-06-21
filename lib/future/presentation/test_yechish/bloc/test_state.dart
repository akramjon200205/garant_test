part of 'test_bloc.dart';

@freezed

class TestState with _$TestState {
    const factory TestState({
    @Default(BlocStatus.notInitialized) final BlocStatus getAllTestStatus,
    final String? message,
    final TestModel? testModel,
  }) = _TestState;

  const TestState._();
}
