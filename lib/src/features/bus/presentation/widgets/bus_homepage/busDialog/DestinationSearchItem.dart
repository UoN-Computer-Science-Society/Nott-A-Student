import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:nott_a_student/src/features/bus/presentation/views/locationview.dart';

class DestinationSearchItem extends StatefulWidget {
  final String location;
  const DestinationSearchItem({super.key, required this.location});

  @override
  State<DestinationSearchItem> createState() => _DestinationSearchItemState();
}

class _DestinationSearchItemState extends State<DestinationSearchItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<LocationCubit>().selectedDestination(widget.location);
        Navigator.pop(context, widget.location);        
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(widget.location,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.info_outline,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationView(
                      locationTitle: widget.location,
                      locationDescription: "Description fors",
                      imageUrls: const [
                        'lib/src/utils/resources/bus_image/UNM_Campus.jpg',
                        'lib/src/utils/resources/bus_image/UNM_Campus2.jpg',
                      ],
                      labels: const [
                        "Supermarket",
                        "Mall",
                        "Groceries",
                        "Any",
                        "Academic"
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
