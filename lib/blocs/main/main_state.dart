part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial({
    InitConfig? initConfig,
    @Default(true) canPop,
  }) = _Initial;
}
