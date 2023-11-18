import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/header.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchBarDestination.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchButton.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchBarDeparture.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //final Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF1C3064), // Set the color of the Container
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const Gap(5),
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
              Text(state.route,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          );
        },
      ),
    );
  }
}
