part of 'location_cubit.dart';

class LocationState extends Equatable {
  final String depature;
  final String destination;
  final String route;

  const LocationState({
    this.depature = '',
    this.destination = '',
    this.route = '',
  });

  LocationState copyWith({
    String? depature,
    String? destination,
    String? route,
  }) {
    return LocationState(
      depature: depature ?? this.depature,
      destination: destination ?? this.destination,
      route: route ?? this.route,
    );
  }

  @override
  List<Object?> get props => [depature, destination, route];
}

class InvalidLocation extends LocationState {
  final String errorMessage;

  const InvalidLocation({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
