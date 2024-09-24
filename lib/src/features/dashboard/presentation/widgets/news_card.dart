
import 'package:Nott_A_Student/src/features/dashboard/domain/models/news_model.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/views/sa_events_details.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class NewsCard extends StatefulWidget {
  NewsCard({
    super.key,
    required NewsModel news,
  }) {
    _news = news;
  }
  late final NewsModel _news;

  @override
  State<NewsCard> createState() => _NewsCardState(_news);

  NewsModel GetNewsInfo() {
    return _news;
  }
}

class _NewsCardState extends State<NewsCard> {
  late final NewsModel _news;
  _NewsCardState(NewsModel news) {
    _news = news;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Logger("NewsCard").info("TAPPED A NEWS CARD: ${_news.cat}");
        if (_news.cat == NewsCategory.sa) {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SAEventsDetailsView(
                  newsModel: _news,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 275),
              ));
          // MaterialPageRoute(
          //     builder: (context) => SAEventsDetailsView(newsModel: _news)));
        } else {
          // TODO: Create usual email view for the email. For now, just open the SA Events view
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SAEventsDetailsView(newsModel: _news)));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xFF3F3F3F), width: 0.4))),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    _news.urlToImage,
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _news.author,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Text(_news.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 5),
                      Text(_news.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _news.GetPublishedDateFormatted(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
