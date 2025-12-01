import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color kPrimaryColor = Color(0xFFE95422);
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerRight,
      child: Material( // Wrap in Material for proper shadows/colors
        child: Container(
          width: screenWidth * 0.8,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(-5, 0),
              ),
            ],
          ),
          child: SafeArea( // Ensures content is below status bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (Profile Info)
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40, color: kPrimaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'john.doe@email.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white54, height: 1),

                // Navigation Items
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.white),
                  title: const Text('Favorites', style: TextStyle(color: Colors.white, fontSize: 16)),
                  onTap: () {
                    // Navigate to favorites screen
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text('Settings', style: TextStyle(color: Colors.white, fontSize: 16)),
                  onTap: () {
                    // Navigate to settings screen
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16)),
                  onTap: () {
                    // Handle logout
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}