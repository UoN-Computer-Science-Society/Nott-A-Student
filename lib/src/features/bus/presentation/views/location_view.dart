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
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: loadLocationData(locationKey),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data found for this location'));
        } else {
          final locationData = snapshot.data!;
          final String locationDescription = locationData['locationDescription'];
          final List<String> imageUrls = List<String>.from(locationData['imageUrls']);
          final List<String> labels = List<String>.from(locationData['labels']);
          final String mapsLink = locationData['mapsLink'];

          return Scaffold(
            appBar: AppBar(
              title: Text(locationKey),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageCarousel(imageUrls: imageUrls),
                  LocationTitle(title: locationKey),
                  LocationDescription(description: locationDescription),
                  LabelsChip(labels: labels),
                  OpenMapsButton(
                    mapsLink: mapsLink,
                    onPressed: () => _launchURL(mapsLink),
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

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  const ImageCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
    );
  }
}

class LocationTitle extends StatelessWidget {
  final String title;

  const LocationTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class LocationDescription extends StatelessWidget {
  final String description;

  const LocationDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(description),
    );
  }
}

class LabelsChip extends StatelessWidget {
  final List<String> labels;

  const LabelsChip({Key? key, required this.labels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: labels.map((label) => Chip(label: Text(label))).toList(),
      ),
    );
  }
}

class OpenMapsButton extends StatelessWidget {
  final String mapsLink;
  final VoidCallback onPressed;

  const OpenMapsButton({
    Key? key,
    required this.mapsLink,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Open Maps'),
      ),
    );
  }
}
