part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.init(InitConfig initConfig) = _Init;
  const factory MainEvent.routeChanged(String route) = _RouteChanged;
}
