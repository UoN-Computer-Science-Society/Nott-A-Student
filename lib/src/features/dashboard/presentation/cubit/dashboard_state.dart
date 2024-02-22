part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final String type;
  final List<NewsModel> news;

  const DashboardState({
    this.type = "All",
    required this.news,
  });

  DashboardState copyWith({
    String? type,
    List<NewsModel>? news,
  }) {
    return DashboardState(type: type ?? this.type, news: news ?? this.news);
  }

  @override
  List<Object> get props => [type];

  static DashboardState initial() {
    return const DashboardState(news: []);
  }
}
