import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/auth/Login.dart';
import 'package:dramaskin/auth/Profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // HEADER
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFF8D7E8), Color(0xFFEEC6DB)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage()));
                    },
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFE8A0C0),
                            width: 2.5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://i.pravatar.cc/150?img=47',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.person,
                              size: 40,
                              color: Color(0xFFE8A0C0),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      Provider.of<UserData>(context).name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      Provider.of<UserData>(context).email,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${Provider.of<UserData>(context).skinType}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFB05880),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // CLOSE BUTTON
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 16),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // MENU ITEMS
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _DrawerItem(
                  emoji: '🏠',
                  label: 'Home',
                  isActive: true,
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(emoji: '✨', label: 'My Routine', onTap: () {}),
                _DrawerItem(emoji: '🛍️', label: 'Shop', onTap: () {}),
                _DrawerItem(emoji: '💉', label: 'Skin Quiz', onTap: () {}),
                _DrawerItem(emoji: '👤', label: 'Profile', onTap: () {}),
                _DrawerItem(emoji: '⚙️', label: 'Settings', onTap: () {}),
              ],
            ),
          ),

          // LOGOUT
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: GestureDetector(
              onTap: () {
                Provider.of<UserData>(context, listen: false).logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    maintainState: false,
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0F5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('🚪', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFFE05580),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.emoji,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFFEEF4) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFFFFD6E8)
                    : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? const Color(0xFFE05580)
                    : const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
