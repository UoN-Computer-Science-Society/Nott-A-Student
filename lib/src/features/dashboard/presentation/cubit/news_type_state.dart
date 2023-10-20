part of 'news_type_cubit.dart';

class NewsTypeState extends Equatable {
  final String type;

  const NewsTypeState({
    this.type = "All",
  });

  NewsTypeState copyWith({
    String? type,
  }) {
    return NewsTypeState(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}


