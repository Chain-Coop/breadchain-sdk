part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial({
    @Default(false) bool initialized,
    @Default(InitConfig()) InitConfig initConfig,
    @Default(true) canPop,
    @Default(true) bool walletBalanceVisible,
  }) = _Initial;
}
