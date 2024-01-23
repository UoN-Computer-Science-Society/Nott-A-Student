import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void setState(String type) {
    emit(state.copyWith(type: type));
  }

  void onNewsTypeChanged(String type) {
    if (type != state.type) {
      emit(state.copyWith(type: type));
    }
  }
}
