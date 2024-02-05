import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/presentation/cubit/cubit/bottom_nav_bar_cubit.dart';

class NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String route;

  const NavItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      buildWhen: (previous, current) {
        return previous.label != current.label;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<BottomNavBarCubit>().onSwitch(label);
            Navigator.of(context).pushReplacementNamed(
              route,
            );
          },
          child: Container(
            width: 90, // Specify the width as per your requirements
            height: 74, // Specify the height as per your requirements
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: context.read<BottomNavBarCubit>().state.label == label
                      ? const Color(0xFF005697)
                      : Colors.white, // Specify the border color
                  width: 2.5, // Specify the border width
                ),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  color: context.read<BottomNavBarCubit>().state.label == label
                      ? const Color(0xFF005697)
                      : const Color(0xFF3B7DB0),
                  icon,
                  size: MediaQuery.of(context).size.width *
                      0.065, // Adjust the icon size as needed
                ),
                const Gap(5),
                Text(label,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.026)),
              ],
            ),
          ),
        );
      },
    );
  }
}
