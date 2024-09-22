import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/search_bar_departure.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/header.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/search_bar_destination.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/search_button.dart';

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
                                const SearchBarDeparture(),
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
              const SwapButton(),
            ],
          );
        },
      ),
    );
  }
}
