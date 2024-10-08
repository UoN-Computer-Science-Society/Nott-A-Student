import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';

// ignore: camel_case_types
class searchButton extends StatelessWidget {
  const searchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth * 0.1;
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 12), // doesn't fix the size of the screen
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: const Color(0xFF059CC0),
        ),
        onPressed: () {
          // TODO: Add your onPressed code here
          print('Search button pressed');

          if (context.read<LocationCubit>().state.departure != "" &&
              context.read<LocationCubit>().state.destination != "") {
            context.read<LocationCubit>().onClickSearchBus();
            Navigator.pushNamed(context, "/search_result");
          }else{
            
          }
        },
        child: const Text(
          'Search',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
