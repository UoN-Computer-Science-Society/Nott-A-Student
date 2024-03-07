import 'package:Nott_A_Student/src/utils/constants/location_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/searchdialog/DestinationSearchItem.dart';


class DestinationDialog extends StatelessWidget {
  const DestinationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text('TO'),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      children: <Widget>[
        ...Locationlist.where((location) =>
            location != context.read<LocationCubit>().state.departure &&
            (context.read<LocationCubit>().state.departure == "Campus" ||
                context.read<LocationCubit>().state.departure ==
                    "Your departure")).map((filteredLocation) =>
            DestinationSearchItem(location: filteredLocation)),
        if (context.read<LocationCubit>().state.departure != "Campus" &&
            context.read<LocationCubit>().state.departure != "Your departure")
          const DestinationSearchItem(location: "Campus")
      ],
    );
  }
}
