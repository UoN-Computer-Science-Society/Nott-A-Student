import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/header.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/newsTypeButton.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/news_card.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/searchBar.dart';
import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';

List newsType = ["All", "SA"," FOSE", "FASS"];

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Header(),
            const Gap(20),
            const searchBar(),
            const SizedBox(height: 10),

            Row(children: [
              Text(
                "Latest News",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ]),
            const Gap(15),
            SizedBox(
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  //   padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    return newsTypeButton(context, newsType[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12.0);
                  },
                  itemCount: 4),
            ),
     const Gap(5),
            Expanded(
              child: ListView(
                // Scroll the NewsCard widgets vertically
                children: const [
                  NewsCard(),
                  NewsCard(),
                  NewsCard(),
                  NewsCard(),
                  NewsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
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
