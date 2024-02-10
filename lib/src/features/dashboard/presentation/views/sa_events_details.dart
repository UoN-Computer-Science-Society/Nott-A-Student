import 'dart:developer';

import 'package:Nott_A_Student/src/features/dashboard/domain/models/news_model.dart';
import 'package:Nott_A_Student/src/features/dashboard/domain/models/sa_events.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SAEventsDetailsView extends StatelessWidget {
  final NewsModel newsModel;
  const SAEventsDetailsView({Key? key, required this.newsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            newsModel.GetCategoryString(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(newsModel.urlToImage),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.network(
                      newsModel.urlToImage,
                      height: 300.0,
                      width: 333.0,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsModel.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          height: 1.1),
                    ),
                    Text("by ${newsModel.author}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      newsModel.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 11,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                            children: <TextSpan>[
                              const TextSpan(text: '📅 Event Date: '),
                              TextSpan(
                                text: DateFormat("d MMMM")
                                    .format(newsModel.eventDate),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        if (newsModel.startTime != null &&
                            newsModel.startTime.isNotEmpty &&
                            newsModel.endTime != null &&
                            newsModel.endTime.isNotEmpty)
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 11,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                              children: <TextSpan>[
                                const TextSpan(text: '⏰ Event Time: '),
                                TextSpan(
                                  text:
                                      '${newsModel.startTime} - ${newsModel.endTime}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        if (newsModel.startTime != null &&
                            newsModel.startTime.isNotEmpty &&
                            newsModel.endTime != null &&
                            newsModel.endTime.isNotEmpty)
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 11,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                              children: <TextSpan>[
                                const TextSpan(text: '📌 Event Venue: '),
                                TextSpan(
                                  text: newsModel.eventVenue,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              showSignUpBtn(context),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Quack! Quack!",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showSignUpBtn(BuildContext context) {
    if (newsModel.url != null && newsModel.url.isNotEmpty) {
      try {
        var uri = Uri.parse(newsModel.url);
        if (uri.hasScheme) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: MediaQuery.of(context).size.width / 2,
            child: ButtonTheme(
              minWidth: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (states) => Theme.of(context).primaryColor,
                )),
                onPressed: () async {
                  // Handle button press
                  if (!await launchUrl(Uri.parse(newsModel.url)))
                    throw 'Could not launch ${newsModel.url}';
                },
                child: Text('Sign up here!',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        height: 1.1),
                    textAlign: TextAlign.center),
              ),
            ),
          );
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return Container();
  }
}
