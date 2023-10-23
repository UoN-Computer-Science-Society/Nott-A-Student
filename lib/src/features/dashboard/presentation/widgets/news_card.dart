
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Computer Science Society",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  const Text("The quick brown fox jumps over.The quick brown fox jumps over"),
                    const SizedBox(height: 4.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1 Jan"),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
