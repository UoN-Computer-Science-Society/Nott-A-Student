import 'dart:developer' as dev;
import 'dart:math';

import 'package:Nott_A_Student/src/features/dashboard/domain/models/NewsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/header.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/newsTypeButton.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/news_card.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/scrollBehaviour.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';

import '../widgets/FeaturedNews.dart';

List newsType = ["ALL", "SA", "FOSE", "FASS", "CAREERS"];

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<NewsCard> news = [];
  List<NewsModel> featuredNews = [];
  String chosenType = "ALL";
  @override
  Widget build(BuildContext context) {
    chosenType = context.read<NewsTypeCubit>().state.type;
    // dev.log(chosenType);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Column(
          children: [
            const Header(),
            const Gap(8),
            if (featuredNews.isNotEmpty) const FeaturedNews(),
            const Gap(8),
            Row(children: [
              Text(
                "Latest News",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ]),
            const Gap(8),
            Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 80,
                      decoration:
                          BlocProvider.of<NewsTypeCubit>(context).state.type ==
                                  "ALL"
                              ? const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xff005697), width: 2)))
                              : const BoxDecoration(),
                      padding: const EdgeInsets.only(bottom: 12),
                    )),
                Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black87, width: 0.5))),
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      height: 40,
                      child: ScrollConfiguration(
                        behavior: scrollBehaviour(),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var button =
                                  newsTypeButton(context, newsType[index]);
                              return button;
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 12.0);
                            },
                            itemCount: newsType.length),
                      ),
                    ))
              ],
            ),
            const Gap(8),
            Expanded(
                child: ScrollConfiguration(
                    behavior: scrollBehaviour(), child: _generateNews())),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _generateNews() {
    return RefreshIndicator(
      onRefresh: () async {
        var num = Random().nextInt(10) + 1;
        dev.log(num.toString());
        List<NewsCard> _news = List.generate(
            num,
            (index) => NewsCard(
                  news: NewsModel(
                      author: "",
                      cat: [
                        NewsCategory.sa,
                        NewsCategory.careers,
                        NewsCategory.fose,
                        NewsCategory.fass,
                      ][Random().nextInt(4)],
                      title:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id est sed elit volutpat mollis.",
                      description: "",
                      url: "",
                      urlToImage:
                          "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                      publishedAt: DateTime.now()),
                ));
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          news.clear();
          news = _news;
        });
        dev.log('Refreshed');
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: news.length != 0 ? news.length : 1,
        // Scroll the NewsCard widgets vertically
        itemBuilder: (context, index) {
          if (news.isNotEmpty) {
            return BlocListener<NewsTypeCubit, NewsTypeState>(
              listener: (context, state) {
                dev.log(state.type);
                setState(() {
                  chosenType = state.type;
                });
              },
              child: Visibility(
                  visible: chosenType == "ALL"
                      ? true
                      : (chosenType ==
                          news[index].GetNewsInfo().GetCategoryString()),
                  child: news[index]),
            );
          } else {
            return noNewsShowing();
          }
        },
      ),
    );
  }

  SizedBox noNewsShowing() {
    return
        //TODO: NOTE THAT IT SHOULD BE MORE FLEX
        SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            //TODO: Update to use sv
            'lib/src/utils/resources/NoNewsVector.png',
            height: 225,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "There are no updates right now. Check back later.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }

  /*  Widget NewsTypeButton (BuildContext context,String text) {
    return BlocBuilder<NewsTypeCubit, NewsTypeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
              context.read<NewsTypeCubit>().onNewsTypeChanged(text);
          },
          child: Container(
            padding: const EdgeInsets.all(8.0), // Add padding
            decoration: BoxDecoration(
              color: context.read<NewsTypeCubit>().state.type == text  ? Colors.blue : Colors.white,
              border: Border.all(
                color: Colors.black, // Border color
                width: 1.0, // Border width
              ),
            ), // Change color when clicked
            child: Center(
              child: Text(
              text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        );
      },
    );
  } */
}
