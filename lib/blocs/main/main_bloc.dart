import 'package:breadchain_sdk/models/init_config.dart';
import 'package:breadchain_sdk/presentation/screens/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const _Initial()) {
    on<_Init>(_init);
    on<_RouteChanged>(_routeChanged);
  }

  void _init(_Init event, Emitter<MainState> emit) {}

  void _routeChanged(_RouteChanged event, Emitter<MainState> emit) {
    emit(MainState.initial(canPop: event.route == DashboardScreen.routeName));
  }
}
