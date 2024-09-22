import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';

class SwapButton extends StatelessWidget {
  const SwapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 145,
      child: InkWell(
        onTap: () {
          context.read<LocationCubit>().swaplocations();
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.swap_vert,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
