import 'package:breadchain_sdk/enums/validation_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saving_group_event.dart';
part 'saving_group_state.dart';
part 'saving_group_bloc.freezed.dart';

class SavingGroupBloc extends Bloc<SavingGroupEvent, SavingGroupState> {
  SavingGroupBloc() : super(const _Initial()) {
    on<_DepositAmountChanged>(_depositAmountChanged);
    on<_NextSavingGroupStage>(_nextSavingGroupStage);
    on<_PreviousSavingGroupStage>(_previousSavingGroupStage);
  }

  void _depositAmountChanged(
      _DepositAmountChanged event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(depositAmount: event.depositAmount));
  }

  void _nextSavingGroupStage(
      _NextSavingGroupStage event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(createOpenGroupStage: state.createOpenGroupStage + 1));
  }

  void _previousSavingGroupStage(
      _PreviousSavingGroupStage event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(createOpenGroupStage: state.createOpenGroupStage - 1));
  }
}
