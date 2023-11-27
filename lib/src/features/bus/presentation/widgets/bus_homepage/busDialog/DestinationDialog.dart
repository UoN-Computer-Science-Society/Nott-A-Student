import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/busDialog/DestinationSearchItem.dart';

// ignore: non_constant_identifier_names
List<String> DestinationLocationlist = [
  'Campus',
  'KTM',
  'TTS',
  'LOTUS',
  'IOI City Mall Putrajaya',
  'Mosque',
  'TBS',
  'KLTC'
];

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
        ...DestinationLocationlist.where((location) =>
            location != context.read<LocationCubit>().state.depature &&
            (context.read<LocationCubit>().state.depature == "Campus" ||
                context.read<LocationCubit>().state.depature ==
                    "Your Depature")).map((filteredLocation) =>
            DestinationSearchItem(location: filteredLocation)),
        if (context.read<LocationCubit>().state.depature != "Campus" &&
            context.read<LocationCubit>().state.depature != "Your Depature")
          const DestinationSearchItem(location: "Campus")
      ],
    );
  }
}
