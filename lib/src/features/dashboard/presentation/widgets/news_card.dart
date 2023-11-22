import 'package:Nott_A_Student/src/features/dashboard/domain/models/NewsModel.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFF3F3F3F), width: 0.4))),
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
                  height: 120.0,
                  width: 120.0,
                  fit: BoxFit.cover,
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
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(_news.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
    );
  }
}
