part of 'saving_group_bloc.dart';

@freezed
class SavingGroupState with _$SavingGroupState {
  const factory SavingGroupState.initial({
    @Default(SavingGroupTitleFormz.initial()) SavingGroupTitleFormz title,
    @Default(0) double depositAmount,
  }) = _Initial;
}

//==============================================================================
// FORMZ
//==============================================================================

enum ValidationError { invalid }

//==============================================================================
// FORMZ - Saving Group Title
//==============================================================================

class SavingGroupTitleFormz extends FormzInput<String, ValidationError> {
  const SavingGroupTitleFormz.initial([super.value = '']) : super.pure();
  const SavingGroupTitleFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      return ValidationError.invalid;
    }

    return null;
  }
}
