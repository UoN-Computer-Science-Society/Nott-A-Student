import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  String selectedLocation = '';

  LocationCubit() : super(const LocationState());

  void selectedDepature(String location) {
    emit(state.copyWith(depature: location));

    print(state.depature);
  }

  void selectedDestination(String location) {
    emit(state.copyWith(destination: location));

    print(state.destination);
  }

  Future<void> swaplocations() async {
    emit(state.copyWith(depature: state.destination ));
    emit(state.copyWith(destination: state.depature));
  }

  // ignore: non_constant_identifier_names
  Future<void> onClickSearchBus() async {
    print('Departure: ${state.depature}, Destination: ${state.destination}');

    String route = '${state.depature} to ${state.destination}';
    emit(state.copyWith(route: route));
    print(state.route);
  }

  // ignore: non_constant_identifier_names
  Future<void> filterLocation_Campus() async {
    // depature != Campus, destination == Campus
    if (state.depature != "Campus" && state.depature != "Your depature") {
      emit(state.copyWith(destination: "Campus"));
    } else if (state.depature == "Campus" && state.destination == "Campus") {
      emit(state.copyWith(
          destination:
              "Your destination")); // need to clear the route or they can't press the search button.
    }
  }
}
