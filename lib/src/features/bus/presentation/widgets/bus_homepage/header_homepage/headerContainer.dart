import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/header.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchBar.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchButton.dart';

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  _HeaderContainerState createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C3064),
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          const Gap(5),
          !isCollapsed
              ? Column(
                  children: [
                    Row(children: [
                      Text(
                        'From:',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ]),
                    const Gap(5),
                    const searchBar(),
                    const Gap(5),
                    Row(children: [
                      Text(
                        'To:',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ]),
                    const Gap(5),
                    const searchBar(),
                    const Gap(15),
                    const searchButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isCollapsed = !isCollapsed;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isCollapsed = !isCollapsed;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      "Dropdown to search for other route",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
