import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/searchdialog/DepartureSearchItem.dart';
import 'package:Nott_A_Student/src/utils/constants/location_list.dart';
import 'package:flutter/material.dart';

class DepatureDialog extends StatelessWidget {
  const DepatureDialog({super.key});

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
              child: Text('FROM'),
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
          for (var location in Locationlist)
            //if(location != context.read<LocationCubit>().state.destination)
            DepatureSearchItem(location: location)
        ]);
  }
}
