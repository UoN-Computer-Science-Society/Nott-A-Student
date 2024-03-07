import 'package:Nott_A_Student/src/features/dashboard/domain/models/news_model.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/news_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  void setState(String type) {
    print("Setting state");
    emit(state.copyWith(type: type));
  }

  void onNewsTypeChanged(String type) {
    if (type != state.type) {
      emit(state.copyWith(type: type));
    }
  }

  void updateNews(List<NewsModel> news) {
    print("Emitting new state: ${news.length}");
    // emit(state.copyWith(news: news));
    print(news);
    emit(state.copyWith(news: news));
  }

  void clearNews() {
    emit(state.copyWith(news: []));
  }
}
