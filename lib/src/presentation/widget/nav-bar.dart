import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-item.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTabSelected;
  final int currentIndex;
  const BottomNavBar({
    Key? key,
    required this.onTabSelected,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(
            label: "Dashboard",
            icon: Icons.dashboard,
            route: '/dashboard',
            isSelected: currentIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          NavItem(
            label: "Timetable",
            icon: Icons.calendar_today,
            route: '/dashboard',
            isSelected: currentIndex == 1,
            onTap: () => onTabSelected(1),
          ),
          NavItem(
            label: "Bus",
            icon: Icons.directions_bus,
            route: '/bus',
            isSelected: currentIndex == 2,
            onTap: () => onTabSelected(2),
          ),
          NavItem(
            label: "Account",
            icon: Icons.person,
            route: '/account',
            isSelected: currentIndex == 3,
            onTap: () => onTabSelected(3),
          ),
        ],
      ),
    );
  }
}
