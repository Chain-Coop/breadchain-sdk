part of 'saving_group_bloc.dart';

@freezed
class SavingGroupEvent with _$SavingGroupEvent {
  const factory SavingGroupEvent.init() = _Init;
  const factory SavingGroupEvent.titleChanged(String title) = _TitleChanged;
  const factory SavingGroupEvent.depositAmountChanged(double depositAmount) =
      _DepositAmountChanged;
  const factory SavingGroupEvent.nextSavingGroupStage() = _NextSavingGroupStage;
  const factory SavingGroupEvent.previousSavingGroupStage() =
      _PreviousSavingGroupStage;
}
