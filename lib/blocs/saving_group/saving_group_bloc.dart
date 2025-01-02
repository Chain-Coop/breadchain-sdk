import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saving_group_event.dart';
part 'saving_group_state.dart';
part 'saving_group_bloc.freezed.dart';

class SavingGroupBloc extends Bloc<SavingGroupEvent, SavingGroupState> {
  SavingGroupBloc() : super(const _Initial()) {
    on<_DepositAmountChanged>(_depositAmountChanged);
  }

  void _depositAmountChanged(
      _DepositAmountChanged event, Emitter<SavingGroupState> emit) {
    emit(state.copyWith(depositAmount: event.depositAmount));
  }
}
