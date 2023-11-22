import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

// Function to load the location data from assets
Future<Map<String, dynamic>> loadLocationData(String locationKey) async {
  final String response =
      await rootBundle.loadString('lib/src/utils/constants/location.json');
  final data = await json.decode(response);
  return data[locationKey];
}

class LocationView extends StatelessWidget {
  final String locationKey;

  const LocationView({Key? key, required this.locationKey}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: loadLocationData(locationKey),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('No data found for this location');
        } else {
          final locationData = snapshot.data!;
          final String locationDescription =
              locationData['locationDescription'];
          final List<String> imageUrls =
              List<String>.from(locationData['imageUrls']);
          final List<String> labels = List<String>.from(locationData['labels']);
          final String mapsLink = locationData['mapsLink'];

          return Scaffold(
            appBar: AppBar(
              title: Text(locationKey),
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
                      locationKey,
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
                      children: labels
                          .map((label) => Chip(label: Text(label)))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () => _launchURL(mapsLink),
                      child: const Text('Open Maps'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
