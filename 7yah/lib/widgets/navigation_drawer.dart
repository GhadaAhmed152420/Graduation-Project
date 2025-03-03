import 'package:flutter/material.dart';

import '../views/login.dart';
import '../views/profile.dart';
import '../views/settings.dart';
import 'drawer_item.dart';
import 'nav_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
        child: Material(
          color: Colors.teal,
          child: Column(
            children: [
              navHeader(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 1,
                color: Colors.white70,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'Profile',
                icon: Icons.person,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Settings',
                icon: Icons.settings,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'log out',
                icon: Icons.logout,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
