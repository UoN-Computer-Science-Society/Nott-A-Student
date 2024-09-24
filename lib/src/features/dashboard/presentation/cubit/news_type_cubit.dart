import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_type_state.dart';

class NewsTypeCubit extends Cubit<NewsTypeState> {
  NewsTypeCubit() : super(const NewsTypeState());

  void setState(String type) {
    log("State set");
    emit(state.copyWith(type: type));
  }

  void onNewsTypeChanged(String type) {
    log(type);
    if (type != state.type) {
      emit(state.copyWith(type: type));
    }
  }
}
