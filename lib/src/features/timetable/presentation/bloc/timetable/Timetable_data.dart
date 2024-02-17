import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
import 'package:Nott_A_Student/src/features/auth/domain/session.dart';
import 'package:equatable/equatable.dart';

class TimetableData {
  final String activity;
  final String module;
  final String type;
  final String day;
  final String start;
  final String end;
  final String duration;
  final String room;
  final String roomDescription;
  final String roomSize;
  final String staff;
  final String weeks;

  final String program;

  const TimetableData({
    required this.activity,
    required this.module,
    required this.type,
    required this.day,
    required this.start,
    required this.end,
    required this.duration,
    required this.room,
    required this.roomDescription,
    required this.roomSize,
    required this.staff,
    required this.weeks,
    required this.program,
  });

  factory TimetableData.fromJson(Map<String, dynamic> json) {
    return TimetableData(
      activity: json['Activity'],
      module: json['Module'],
      type: json['Type'],
      day: json['Day'],
      start: json['Start'],
      end: json['End'],
      duration: json['Duration'],
      room: json['Room'],
      roomDescription: json['Room Description'],
      roomSize: json['Room Size'],
      staff: json['Staff'],
      weeks: json['Weeks'],
      program: json['Program'],
    );
  }
}
