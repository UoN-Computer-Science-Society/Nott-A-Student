import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/header.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/newsTypeButton.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/news_card.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/scrollBehaviour.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/searchBar.dart';
import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';

import '../widgets/FeaturedNews.dart';

List newsType = ["ALL", "SA", "FOSE", "FASS", "CAREERS"];

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
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Column(
          children: [
            const Header(),
            const Gap(8),
            const FeaturedNews(),
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
                              if (index < 1) {
                                BlocProvider.of<NewsTypeCubit>(context)
                                    .setState("ALL");
                              }
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
                behavior: scrollBehaviour(),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
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
            ),
          ],
        ),
      ),
      /*  bottomNavigationBar: BottomNavigationBar(

        items: const[
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            label: 'Timetable',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: 'Bus',
            icon: Icon(Icons.bus_alert),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person),
          ),
        ],
        selectedItemColor: Color(0xFF005697), // Selected item color
        unselectedItemColor: Color(0xFF3B7DB0), // Unselected item color
        showSelectedLabels: true, // Show labels for selected items
        showUnselectedLabels: true, // Show labels for unselected items
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value; // Update the selected index
            print(_selectedIndex);
          });
        },
      ), */
      bottomNavigationBar: BottomNavBar(),
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
