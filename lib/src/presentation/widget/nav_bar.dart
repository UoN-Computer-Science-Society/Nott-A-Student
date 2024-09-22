import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      elevation: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(
            label: "Dashboard",
            icon: Icons.dashboard,
            route: '/dashboard',
          ),
          NavItem(
              label: "Timetable",
              icon: Icons.calendar_today,
              route: '/timetable'),
          NavItem(label: "Bus", icon: Icons.directions_bus, route: '/bus'),
          NavItem(label: "Account", icon: Icons.person, route: '/account'),
        ],
      ),
    );
  }
}
