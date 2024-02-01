import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  TimetableBloc() : super(TimetableInitial()) {
    on<TimetableEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
