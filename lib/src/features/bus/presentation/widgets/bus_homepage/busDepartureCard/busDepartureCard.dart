import 'package:flutter/material.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/busDepartureCardDetails.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/headerbusDeparturing.dart';

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
          busDepartureCardDetails(),
          busDepartureCardDetails(),
          busDepartureCardDetails(),
        ],
      ),
    );
  }
}
