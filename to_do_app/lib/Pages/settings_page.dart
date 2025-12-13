import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/sign_in_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsOn = true;

  // Theme colors
  final Color primary = const Color(0xFF13ECA4);
  final Color backgroundLight = const Color(0xFFF6F8F7);
  final Color backgroundDark = const Color(0xFF10221C);
  final Color surfaceAltDark = const Color(0xFF152A23);
  final Color surfaceHighlight = const Color(0xFF23483C);
  final Color textSecondary = const Color(0xFF92C9B7);

  final String avatarUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDR4SWP3l-q6ti4cL80OAKQoXrNfNRT7o-xKW2VUi-nNzqw-QtMgXnrTu89dVtm4zYkTjApypMnHSLHthp271mF6m2d4xVzszmkN0OcM1rfB6G1AnoeqSlw66QvkipvVHhbIqgU8HO1ld-3DPpDbbMewyk3GlI0ZyUsAAbcb9m776F-GgU-TosiI-gvgo04yrqj9q-G9HLymetr0h-uf6NMaF0f6TXW3gIYjqDyqcyZ7dqVlmsj3H-SOuRIfufxd12cMUf3zmhslIsT';

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(isDark),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildProfileCard(isDark),
              ),

              // General Section
              _sectionLabel('General', isDark),
              _card(isDark, [
                _rowWithSwitch(
                  isDark,
                  icon: Icons.notifications,
                  title: 'Notifications',
                  value: notificationsOn,
                  onChanged: (v) => setState(() => notificationsOn = v),
                ),
              ]),

              // Appearance Section (example)
              _sectionLabel('Appearance', isDark),
              _card(isDark, [
                _buildClickableRowWithTrailing(
                  isDark,
                  icon: Icons.palette,
                  iconBg: Colors.blue.shade100,
                  iconColor: Colors.blue.shade600,
                  title: 'Theme',
                  trailingText: 'Dark',
                ),
              ]),

              // About Section
              _sectionLabel('About', isDark),
              _card(isDark, [
                _row(icon: Icons.lock, title: 'Privacy Policy', isDark: isDark),
                _divider(isDark),
                _row(
                  icon: Icons.description,
                  title: 'Terms of Service',
                  isDark: isDark,
                ),
              ]),

              // LOGOUT
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? surfaceAltDark : Colors.white,
                      foregroundColor: Colors.red.shade600,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              Text(
                'To-Do App v1.0.2',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: isDark ? Colors.white : Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildProfileCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? surfaceAltDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 48, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(height: 12),
          Text(
            'Alex Johnson',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'alex.johnson@example.com',
            style: TextStyle(
              color: isDark ? textSecondary : Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            color: isDark ? textSecondary : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  Widget _card(bool isDark, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? surfaceAltDark : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: children),
      ),
    );
  }

  Widget _divider(bool isDark) {
    return Divider(
      height: 1,
      color: isDark ? Colors.white12 : Colors.grey.shade200,
    );
  }

  Widget _row({
    required IconData icon,
    required String title,
    required bool isDark,
  }) {
    return ListTile(
      leading: Icon(icon, color: primary),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _rowWithSwitch(
    bool isDark, {
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: primary),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: primary,
    );
  }

  Widget _buildClickableRowWithTrailing(
    bool isDark, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    String? trailingText,
    IconData? trailingIcon,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        child: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ),
            if (trailingText != null)
              Row(
                children: [
                  Text(
                    trailingText,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? textSecondary : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            Icon(
              trailingIcon ?? Icons.chevron_right,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
