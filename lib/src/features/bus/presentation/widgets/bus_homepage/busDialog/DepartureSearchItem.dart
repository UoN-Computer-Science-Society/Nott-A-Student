import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/views/location_view.dart';

class DepatureSearchItem extends StatefulWidget {
  final String location;
  const DepatureSearchItem({super.key, required this.location});

  @override
  State<DepatureSearchItem> createState() => _DepatureSearchItemState();
}

class _DepatureSearchItemState extends State<DepatureSearchItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<LocationCubit>().selectedDepature(widget.location);
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
                      locationKey: widget.location,
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
