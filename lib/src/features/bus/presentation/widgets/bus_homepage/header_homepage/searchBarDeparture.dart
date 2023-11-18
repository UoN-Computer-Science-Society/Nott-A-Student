import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDialog/DepatureDialog.dart';

class searchBarDeparture extends StatelessWidget {
  const searchBarDeparture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        showDialog(
            context: context,
            builder: (BuildContext diaglofcontext) {
              return const DepatureDialog();
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
            Icon(Icons.search_rounded, color: Colors.black),
            SizedBox(width: 8.0),
            InkWell(
              child: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () => _showDepartureDialog(context),
                    child: BlocListener<LocationCubit, LocationState>(
                      listener: (context, state) {
                        context.read<LocationCubit>().filterLocation_Campus();
                      },
                      child: Text(
                          state.depature.isEmpty
                              ? 'Your Depature'
                              : state.depature,
                          style: const TextStyle(fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDepartureDialog(BuildContext context) {
    String selectedLocation = "";
    context.read<LocationCubit>().selectedDepature(selectedLocation);
  }
}