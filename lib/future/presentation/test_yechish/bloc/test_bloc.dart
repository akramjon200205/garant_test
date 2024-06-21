import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_garant/future/common/enums/bloc_status.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';
import 'package:test_garant/future/presentation/data/repository/test_repository.dart';

part 'test_event.dart';
part 'test_state.dart';
part 'test_bloc.freezed.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final TestRepository themesRepository;
  TestBloc({required this.themesRepository}) : super(const TestState()) {
    on<TestEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetTestEvent>(_getTestEvent);
  }

  _getTestEvent(GetTestEvent event, emit) async {
    emit(state.copyWith(getAllTestStatus: BlocStatus.inProgress));
    final result = await themesRepository.getTestModel();
    result.fold(
      (l) => state.copyWith(
        getAllTestStatus: BlocStatus.failed,
        message: l.message,
      ),
      (r) => emit(
        state.copyWith(getAllTestStatus: BlocStatus.completed, testModel: r),
      ),
    );
  }
}
