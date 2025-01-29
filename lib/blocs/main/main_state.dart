part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial({
    @Default(true) canPop,
    @Default(true) bool walletBalanceVisible,
  }) = _Initial;
}
