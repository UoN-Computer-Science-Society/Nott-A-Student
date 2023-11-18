import 'package:flutter/material.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDialog/DestinationSearchItem.dart';

// ignore: non_constant_identifier_names
List<String> DestinationLocationlist = [
  'Campus',
  'KTM',
  'TTS',
  'LOTUS',
  'IOI City Mall Putrajaya',
  'Mosque',
  'TBS'
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
          for (var location in DestinationLocationlist)
            DestinationSearchItem(location: location)
        ]);
  }
}
