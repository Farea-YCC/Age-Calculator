import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:agecalculator/utils/const.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kprimaryColor,
              kprimaryColor
                  .withOpacity(0.3), // Lighter gradient for subtle effect
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header with profile picture and information
            _buildDrawerHeader(),

            // Drawer items with grouping
            _buildDrawerSection(
              context: context,
              items: [
                _buildDrawerItem(
                  icon: Icons.date_range,
                  title: 'احسب عمرك',
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to age calculator screen
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.share_outlined,
                  title: 'مشاركة التطبيق',
                  onTap: () {
                    Share.share('شارك تطبيق حساب العمر مع أصدقائك!');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const Divider(color: kbuttonColor, height: 1),

            _buildDrawerSection(
              context: context,
              items: [
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  title: 'الإعدادات',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.help_outline,
                  title: 'المساعدة',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const Divider(color: kbuttonColor, height: 1),

            _buildDrawerSection(
              context: context,
              items: [
                _buildDrawerItem(
                  icon: Icons.logout,
                  title: 'تسجيل الخروج',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // A helper function to build individual list items in the drawer
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: kbuttonColor),
      title: Text(
        title,
        style: const TextStyle(
          color: kbuttonColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      dense: true,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
    );
  }

  // A helper function to group drawer items into sections
  Widget _buildDrawerSection({
    required BuildContext context,
    required List<Widget> items,
  }) {
    return Column(
      children: items,
    );
  }

  // A helper function ld the header with profile image and info
  Widget _buildDrawerHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.vertical(
            bottom:
                Radius.circular(1)), // Rounded bottom corners for a modern look
      ),
      child: SingleChildScrollView(
        // Make content scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture using CircleAwith the letter 'F'
            SizedBox(
              width: double.infinity,
              height: 100,
              child: CircleAvatar(
                radius: 50, // Adjusted for better aesthetics
                backgroundColor: kbuttonColor,
                child: Text(
                  'F',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28, // Larger font size for a profes look
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12), // Spacing between avatar and name
            // Removed the Text widgets for name and email
          ],
        ),
      ),
    );
  }
}
