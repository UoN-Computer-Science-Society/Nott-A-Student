import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_type_state.dart';

class NewsTypeCubit extends Cubit<NewsTypeState> {
  NewsTypeCubit() : super(NewsTypeState());

  void setState(String type) {
    emit(state.copyWith(type: type));
  }

  void onNewsTypeChanged(String type) {
    print(type);
    if (type != state.type) {
      emit(state.copyWith(type: type));
    }
  }
}
