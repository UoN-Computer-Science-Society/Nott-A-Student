import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/header.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchBarDestination.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchButton.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchBarDeparture.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/swapButton.dart';

/* 
class HeaderContainer extends StatefulWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  _HeaderContainerState createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return /* Container(
      color: const Color(0xFF1C3064), // Set the color of the Container
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                                const searchBarDeparture(),
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
                                const searchBarDestination(),
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
                ],
              ),
              const swapButton(),
            ],
          );
        },
      ),
    ); */
        SliverAppBar(
      expandedHeight:
      isCollapsed ? 56 : 300, // Adjust the expanded height as needed
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFF1C3064),
       automaticallyImplyLeading: false,
       toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
      
        background: Column(
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
                      const searchBarDeparture(),
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
                      const searchBarDestination(),
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
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
 */

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  _HeaderContainerState createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: isCollapsed ? 56 : 270,
      floating: true,
      pinned: true,
      backgroundColor: const Color(0xFF1C3064),
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1C3064), Color(0xFF0A1730)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Header(),
                        const Gap(5),
                      Column(
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
                                  const searchBarDeparture(),
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
                                  const searchBarDestination(),
                                  const Gap(15),
                                  const searchButton(),
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                right: 16.0, // Adjust the right position as needed
                top: 0.0,
                child: swapButton(), // Your SwapButton widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}
