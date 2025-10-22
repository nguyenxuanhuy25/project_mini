import 'package:flutter/material.dart';
import 'package:project_mini/services.dart/auth/auth_service.dart';
import 'package:project_mini/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    size: 65,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),

              // home list title
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              // setting list title
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingPage()),
                    );
                  },
                ),
              ),
            ],
          ),

          // logout
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              textColor: Theme.of(context).colorScheme.inversePrimary,
              onTap: () {
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
