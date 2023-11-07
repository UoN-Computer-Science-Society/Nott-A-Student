import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/scrollBehaviour.dart';
import 'FeaturedNewsCard.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text(
          "Upcoming Events",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ]),
      const Gap(10),
      ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 200,
          ),
          child: ScrollConfiguration(
              behavior: scrollBehaviour(),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  //   padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    return const FeaturedNewsCard();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12.0);
                  },
                  itemCount: 2)))
    ]);
  }
}
