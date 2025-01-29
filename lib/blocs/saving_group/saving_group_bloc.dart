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
    on<_NextOpenSavingGroupStage>(_nextOpenSavingGroupStage);
    on<_PreviousOpenSavingGroupStage>(_previousOpenSavingGroupStage);
    on<_FirstOpenSavingGroupStage>(_firstOpenSavingGroupStage);
  }

  void _depositAmountChanged(
      _DepositAmountChanged event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(depositAmount: event.depositAmount));
  }

  void _nextOpenSavingGroupStage(
      _NextOpenSavingGroupStage event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(createOpenGroupStage: state.createOpenGroupStage + 1));
  }

  void _previousOpenSavingGroupStage(
      _PreviousOpenSavingGroupStage event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(createOpenGroupStage: state.createOpenGroupStage - 1));
  }

  void _firstOpenSavingGroupStage(
      _FirstOpenSavingGroupStage event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(createOpenGroupStage: 1));
  }
}
