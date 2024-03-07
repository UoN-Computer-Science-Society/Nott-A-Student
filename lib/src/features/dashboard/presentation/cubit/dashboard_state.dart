part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final String type;
  List<NewsModel> news;

  DashboardState({
    this.type = "All",
    this.news = const [],
  });

  DashboardState copyWith({
    String? type,
    List<NewsModel>? news,
  }) {
    return DashboardState(type: type ?? this.type, news: news ?? this.news);
  }

  @override
  List<Object> get props => [type, news];

  static DashboardState initial() {
    return DashboardState();
  }
}
