part of 'bottom_nav_bar_cubit.dart';

class BottomNavBarState extends Equatable {
  final String label;

  const BottomNavBarState({
    this.label = "Dashboard",
  });

  BottomNavBarState copyWith({
    String? label,
  }) {
    return BottomNavBarState(
      label: label ?? this.label,
    );
  }

  @override
  List<Object> get props => [label];
}
