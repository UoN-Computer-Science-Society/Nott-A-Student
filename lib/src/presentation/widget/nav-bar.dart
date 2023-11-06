import 'package:flutter/material.dart';
import 'package:nott_a_student/src/presentation/widget/nav-item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavItem(label: "Dashboard", icon: Icons.dashboard,route: '/dashboard',),
        NavItem(label: "Timetable", icon: Icons.calendar_today,route: '/dashboard'),
        NavItem(label: "Bus", icon: Icons.directions_bus,route: '/dashboard'),
        NavItem(label: "Account", icon: Icons.person,route: '/account'),
      ],
    );
  }
}