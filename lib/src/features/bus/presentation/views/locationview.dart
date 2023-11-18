import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationView extends StatelessWidget {
  final String locationTitle;
  final String locationDescription;
  final List<String> imageUrls; // URLs of images to display
  final List<String> labels; // Labels about the location

  const LocationView({
    Key? key,
    required this.locationTitle,
    required this.locationDescription,
    required this.imageUrls,
    required this.labels,
  }) : super(key: key);

  void _launchURL() async {
    const url = 'https://www.google.com/maps?cid=912336641389830545';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200, // Height of image carousel
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(imageUrls[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                locationTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(locationDescription),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0, // Space between labels
                children:
                    labels.map((label) => Chip(label: Text(label))).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Open Maps'),
        ),
      ),
    );
  }
}
