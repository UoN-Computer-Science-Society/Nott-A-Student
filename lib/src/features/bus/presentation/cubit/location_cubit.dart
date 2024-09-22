import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Nott_A_Student/src/features/bus/data/data%20source/local/favourite_route.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState());

  void selectedDeparture(String location) {
    emit(state.copyWith(departure: location));
  }

  void selectedDestination(String location) {
    emit(state.copyWith(destination: location));
  }

  void onChangedRoute(String route) {
    emit(state.copyWith(route: route));
  }

  Future<void> swaplocations() async {
    String tempDestination = state.destination;
    String tempDeparture = state.departure;

    emit(state.copyWith(departure: tempDestination));
    emit(state.copyWith(destination: tempDeparture));
  }

  // ignore: non_constant_identifier_names
  Future<void> onClickSearchBus() async {
    String route = '${state.departure} to ${state.destination}';
    emit(state.copyWith(route: route));
  }


  Future<void> filterLocationCampus() async {
    if (state.departure != "Campus" && state.departure != "") {
      emit(state.copyWith(destination: "Campus"));
    } else if (state.departure == "Campus" && state.destination == "Campus") {
      emit(state.copyWith(destination: ""));
    }
  }

  Future<void> addOrRemoveFavourite(String route) async {
    if (await checkIsRouteExists(route)) {
      await removeFavouriteRoute(route);
    } else {
      await saveFavouriteRoute(route);
    }
  }

  Future<bool> isRouteExists() async {
    if (await checkIsRouteExists(state.route)) {
      return true;
    } else {
      return false;
    }
  }
}
