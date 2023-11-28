import 'package:flutter/material.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDialog/DepartureSearchItem.dart';

// ignore: non_constant_identifier_names
List<String> DepatureLocationlist = [
  'Campus',
  'KTM',
  'TTS',
  'LOTUS',
  'IOI City Mall Putrajaya',
  'Mosque',
  'TBS',
  'KLTC'
];

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
          for (var location in DepatureLocationlist)
            //if(location != context.read<LocationCubit>().state.destination)
            DepatureSearchItem(location: location)
        ]);
  }
}
