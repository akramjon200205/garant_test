// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestState {
  BlocStatus get getAllTestStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  TestModel? get testModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestStateCopyWith<TestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestStateCopyWith<$Res> {
  factory $TestStateCopyWith(TestState value, $Res Function(TestState) then) =
      _$TestStateCopyWithImpl<$Res, TestState>;
  @useResult
  $Res call(
      {BlocStatus getAllTestStatus, String? message, TestModel? testModel});
}

/// @nodoc
class _$TestStateCopyWithImpl<$Res, $Val extends TestState>
    implements $TestStateCopyWith<$Res> {
  _$TestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllTestStatus = null,
    Object? message = freezed,
    Object? testModel = freezed,
  }) {
    return _then(_value.copyWith(
      getAllTestStatus: null == getAllTestStatus
          ? _value.getAllTestStatus
          : getAllTestStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      testModel: freezed == testModel
          ? _value.testModel
          : testModel // ignore: cast_nullable_to_non_nullable
              as TestModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestStateImplCopyWith<$Res>
    implements $TestStateCopyWith<$Res> {
  factory _$$TestStateImplCopyWith(
          _$TestStateImpl value, $Res Function(_$TestStateImpl) then) =
      __$$TestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus getAllTestStatus, String? message, TestModel? testModel});
}

/// @nodoc
class __$$TestStateImplCopyWithImpl<$Res>
    extends _$TestStateCopyWithImpl<$Res, _$TestStateImpl>
    implements _$$TestStateImplCopyWith<$Res> {
  __$$TestStateImplCopyWithImpl(
      _$TestStateImpl _value, $Res Function(_$TestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllTestStatus = null,
    Object? message = freezed,
    Object? testModel = freezed,
  }) {
    return _then(_$TestStateImpl(
      getAllTestStatus: null == getAllTestStatus
          ? _value.getAllTestStatus
          : getAllTestStatus // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      testModel: freezed == testModel
          ? _value.testModel
          : testModel // ignore: cast_nullable_to_non_nullable
              as TestModel?,
    ));
  }
}

/// @nodoc

class _$TestStateImpl extends _TestState {
  const _$TestStateImpl(
      {this.getAllTestStatus = BlocStatus.notInitialized,
      this.message,
      this.testModel})
      : super._();

  @override
  @JsonKey()
  final BlocStatus getAllTestStatus;
  @override
  final String? message;
  @override
  final TestModel? testModel;

  @override
  String toString() {
    return 'TestState(getAllTestStatus: $getAllTestStatus, message: $message, testModel: $testModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestStateImpl &&
            (identical(other.getAllTestStatus, getAllTestStatus) ||
                other.getAllTestStatus == getAllTestStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.testModel, testModel) ||
                other.testModel == testModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, getAllTestStatus, message, testModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestStateImplCopyWith<_$TestStateImpl> get copyWith =>
      __$$TestStateImplCopyWithImpl<_$TestStateImpl>(this, _$identity);
}

abstract class _TestState extends TestState {
  const factory _TestState(
      {final BlocStatus getAllTestStatus,
      final String? message,
      final TestModel? testModel}) = _$TestStateImpl;
  const _TestState._() : super._();

  @override
  BlocStatus get getAllTestStatus;
  @override
  String? get message;
  @override
  TestModel? get testModel;
  @override
  @JsonKey(ignore: true)
  _$$TestStateImplCopyWith<_$TestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
