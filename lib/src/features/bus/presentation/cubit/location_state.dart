part of 'location_cubit.dart';

class LocationState extends Equatable {
  final String departure;
  final String destination;
  final String route;

  const LocationState({
    this.departure = '',
    this.destination = '',
    this.route = '',
  });

  LocationState copyWith({
    String? departure,
    String? destination,
    String? route,
  }) {
    return LocationState(
      departure: departure ?? this.departure,
      destination: destination ?? this.destination,
      route: route ?? this.route,
    );
  }

  @override
  List<Object?> get props => [departure, destination, route];
}

class InvalidLocation extends LocationState {
  final String errorMessage;

  const InvalidLocation({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
