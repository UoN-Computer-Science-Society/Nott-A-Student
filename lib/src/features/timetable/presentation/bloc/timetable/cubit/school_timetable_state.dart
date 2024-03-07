part of 'school_timetable_cubit.dart';

class SchoolTimetableState extends Equatable {
  final List<Activity> timetableData;
  final String selectedDay; // New field to store the selected day

  // Constructor with default values for timetableData and selectedDay
  SchoolTimetableState({
    this.timetableData = const [],
    this.selectedDay = '', // Initialize selectedDay with current day
  });

  // CopyWith method to create a new instance of SchoolTimetableState
  SchoolTimetableState copyWith({
    List<Activity>? timetableData,
    String? selectedDay, // Update selectedDay in copyWith
  }) {
    return SchoolTimetableState(
      timetableData: timetableData ?? this.timetableData,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }

  // Override props getter from Equatable for object comparison
  @override
  List<Object> get props => [timetableData, selectedDay];
}