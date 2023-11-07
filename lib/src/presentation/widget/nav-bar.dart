import 'package:flutter/material.dart';
import 'package:nott_a_student/src/presentation/widget/nav-item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(label: "Dashboard", icon: Icons.dashboard),
          NavItem(label: "Timetable", icon: Icons.calendar_today),
          NavItem(label: "Bus", icon: Icons.directions_bus),
          NavItem(label: "Account", icon: Icons.person),
        ],
      ),
    );
  }
}
