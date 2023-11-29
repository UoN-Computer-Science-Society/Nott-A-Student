import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';

class swapButton extends StatelessWidget {
  const swapButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    // Calculate button size as a percentage of the screen size
    final buttonSize =
        screenSize.width * 0.11; // example for 10% of the screen width

    return Positioned(
      right: 10,
      bottom: screenSize.height *
          0.12, // position at 10% from the bottom of the screen
      child: BlocListener<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is InvalidLocation) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Select your destination: ${state.errorMessage}'),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
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
            // Set the size of the button
            width: buttonSize,
            height: buttonSize,
            child: const Icon(
              Icons.swap_vert,
              color: Colors.white,
              size: 30, // You might want to adjust this as well
            ),
          ),
        ),
      ),
    );
  }
}
