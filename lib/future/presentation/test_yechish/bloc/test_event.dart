part of 'test_bloc.dart';

sealed class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class GetTestEvent extends TestEvent {
  
  const GetTestEvent();
}
