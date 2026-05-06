import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/auth/Login.dart';
import 'package:dramaskin/auth/Profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotifOn = true;
  bool isSoundOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading:  GestureDetector(

          onTap: () {
            Navigator.pop(context);
          },

          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        centerTitle: true,

      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [

              const SizedBox(height: 30),

              _buildHeader("My Account", const Color(0xFFFCC2D7)),
              const SizedBox(height: 10),

              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                  },
                  child: _buildSimpleTile("Edit Profile", const Color(0xFFFF4D8D))),
              _buildSimpleTile("Change Password", const Color(0xFFFF4D8D)),
              _buildSimpleTile("Re-take Quiz", const Color(0xFFFF4D8D)),

              const SizedBox(height: 35),

              _buildHeader(
                "Notifications",
                const Color(0xFFCDB4DB),
                icon: Icons.notifications_none_rounded,
              ),
              const SizedBox(height: 10),

              _buildSwitchTile(
                "Notifications",
                isNotifOn,
                const Color(0xFFB185DB),
                    (val) {
                  setState(() => isNotifOn = val);
                },
              ),

              _buildSwitchTile(
                "Notifications sound",
                isSoundOn,
                Colors.grey.shade400,
                    (val) {
                  setState(() => isSoundOn = val);
                },
              ),

              const SizedBox(height: 35),

              _buildHeader(
                "More",
                const Color(0xFFBDE0FE),
                icon: Icons.more_horiz_rounded,
              ),
              const SizedBox(height: 10),

              _buildIconTile(
                "Language",
                Icons.language_rounded,
                const Color(0xFF4CC9F0),
              ),

              GestureDetector(

                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                Provider.of<UserData>(context ,listen: false).logout();
                  },

                child: _buildIconTile(
                  "Logout",
                  Icons.logout_rounded,
                  const Color(0xFF4CC9F0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title, Color bgColor, {IconData? icon}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 24, color: Colors.black),
            const SizedBox(width: 12),
          ],
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleTile(String title, Color arrowColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: arrowColor,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
      String title,
      bool value,
      Color activeColor,
      ValueChanged<bool> onChanged,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: activeColor,
              activeColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconTile(String title, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          Icon(
            icon,
            color: iconColor,
            size: 26,
          ),
        ],
      ),
    );
  }
}