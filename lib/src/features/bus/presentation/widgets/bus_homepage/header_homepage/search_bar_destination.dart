import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/searchdialog/DestinationDialog.dart';

class searchBarDestination extends StatelessWidget {
  const searchBarDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        showDialog(
            context: context,
            builder: (BuildContext diaglofcontext) {
              return const DestinationDialog();
            });
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.search_rounded, color: Colors.black),
            const SizedBox(width: 8.0),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                return Text(
                    state.destination.isEmpty
                        ? 'Your Destination'
                        : state.destination,
                    style: const TextStyle(fontSize: 16));
              },
            ),
          ],
        ),
      ),
    );
  }
}
