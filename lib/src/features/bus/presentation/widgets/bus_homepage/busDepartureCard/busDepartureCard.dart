import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/busDepartureCardDetails.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/headerbusDeparturing.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/scrollBehaviour.dart';

class BusDepartureCard extends StatelessWidget {
  const BusDepartureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderBusDepartureCard(),
          //const Gap(5),
          busDepartureCardDetails(),
          /* Expanded(
            child: ScrollConfiguration(
              behavior: scrollBehaviour(),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: 10, // Replace with the number of items you want to display
                itemBuilder: (context, index) {
                  return const busDepartureCardDetails();
                },
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
