part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final String type;

  const DashboardState({
    this.type = "All",
  });

  DashboardState copyWith({
    String? type,
  }) {
    return DashboardState(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}
