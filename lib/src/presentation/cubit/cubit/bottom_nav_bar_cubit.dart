import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState());

    void onSwitch(String label) {
    print(label);
    if (label != state.label) {
      emit(state.copyWith(label: label));
    }
  }

  
}


