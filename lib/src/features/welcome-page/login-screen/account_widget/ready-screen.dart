import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
              "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
              height: 175.0),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Aboard! [Username]",
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
          const Gap(10),
          Text(
            "Your journey with Nott a Student begins now,and we're excited to  be part of it",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.normal),
          ),
          const Gap(20),
          InkWell(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Placeholder()),
              );
            }),
            child: Container(
              width: 250,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: const Center(
                child: Text(
                  "Get started",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
