import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/sign_in_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // state for switches & controls
  bool notificationsOn = true;
  bool agreeTerms =
      false; // not used on this screen but left for parity if needed
  // colors from the Tailwind config you provided
  final Color primary = const Color(0xFF13ECA4);
  final Color backgroundLight = const Color(0xFFF6F8F7);
  final Color backgroundDark = const Color(0xFF10221C);
  final Color surfaceDark = const Color(0xFF1C2E28);
  final Color surfaceAltDark = const Color(
    0xFF152A23,
  ); // used in some cards in HTML
  final Color surfaceHighlight = const Color(0xFF23483C);
  final Color textSecondary = const Color(0xFF92C9B7);
  final String avatarUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDR4SWP3l-q6ti4cL80OAKQoXrNfNRT7o-xKW2VUi-nNzqw-QtMgXnrTu89dVtm4zYkTjApypMnHSLHthp271mF6m2d4xVzszmkN0OcM1rfB6G1AnoeqSlw66QvkipvVHhbIqgU8HO1ld-3DPpDbbMewyk3GlI0ZyUsAAbcb9m776F-GgU-TosiI-gvgo04yrqj9q-G9HLymetr0h-uf6NMaF0f6TXW3gIYjqDyqcyZ7dqVlmsj3H-SOuRIfufxd12cMUf3zmhslIsT';

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBg = isDark ? backgroundDark : backgroundLight;

    // Constrain width similar to max-w-md
    final maxContentWidth = 420.0;

    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // container that replicates the outer wrapper in HTML
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    child: Column(
                      children: [
                        // Header
                        _buildHeader(isDark),

                        // Profile Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          child: _buildProfileCard(isDark),
                        ),

                        // General Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildSectionLabel('General', isDark),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildCardContainer(
                            isDark,
                            children: [
                              // Notifications row with custom style switch
                              _buildRowWithSwitch(
                                isDark,
                                icon: Icons.notifications,
                                iconBg: Colors.orange.shade100,
                                iconColor: Colors.orange.shade600,
                                title: 'Notifications',
                                switchValue: notificationsOn,
                                onChanged: (v) =>
                                    setState(() => notificationsOn = v),
                              ),
                              _divider(isDark),

                              // Sounds & Haptics row (button)
                              _buildClickableRow(
                                isDark,
                                icon: Icons.volume_up,
                                iconBg: Colors.pink.shade100,
                                iconColor: Colors.pink.shade600,
                                title: 'Sounds & Haptics',
                              ),
                            ],
                          ),
                        ),

                        // Appearance Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildSectionLabel('Appearance', isDark),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildCardContainer(
                            isDark,
                            children: [
                              _buildClickableRowWithTrailing(
                                isDark,
                                icon: Icons.palette,
                                iconBg: Colors.blue.shade100,
                                iconColor: Colors.blue.shade600,
                                title: 'Theme',
                                trailingText: 'Dark',
                              ),
                              _divider(isDark),
                              _buildClickableRow(
                                isDark,
                                icon: Icons.apps,
                                iconBg: Colors.purple.shade100,
                                iconColor: Colors.purple.shade600,
                                title: 'App Icon',
                              ),
                            ],
                          ),
                        ),

                        // Data & Sync Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildSectionLabel('Data & Sync', isDark),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildCardContainer(
                            isDark,
                            children: [
                              _buildClickableRowWithTrailing(
                                isDark,
                                icon: Icons.sync,
                                iconBg: Colors.green.shade100,
                                iconColor: Colors.green.shade600,
                                title: 'Sync Tasks',
                                trailingText: 'Just now',
                                trailingIcon: Icons.refresh,
                              ),
                              _divider(isDark),
                              _buildClickableRow(
                                isDark,
                                icon: Icons.download,
                                iconBg: Colors.grey.shade100,
                                iconColor: Colors.grey.shade700,
                                title: 'Export Data',
                              ),
                            ],
                          ),
                        ),

                        // About Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildSectionLabel('About', isDark),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _buildCardContainer(
                            isDark,
                            children: [
                              _buildClickableRow(
                                isDark,
                                icon: Icons.lock,
                                iconBg: Colors.teal.shade100,
                                iconColor: Colors.teal.shade600,
                                title: 'Privacy Policy',
                              ),
                              _divider(isDark),
                              _buildClickableRow(
                                isDark,
                                icon: Icons.description,
                                iconBg: Colors.teal.shade100,
                                iconColor: Colors.teal.shade600,
                                title: 'Terms of Service',
                              ),
                            ],
                          ),
                        ),

                        // Footer: Logout & version text
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 20.0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isDark
                                        ? surfaceAltDark
                                        : Colors.white,
                                    foregroundColor: Colors.red.shade600,
                                    elevation: 0,
                                    shadowColor: Colors.black.withOpacity(0.06),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    side: BorderSide(
                                      color: isDark
                                          ? Colors.white.withOpacity(0.04)
                                          : Colors.transparent,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                  child: Text(
                                    'Log Out',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'To-Do App v1.0.2',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? Colors.grey.shade500
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Made with ❤️ for productivity',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? Colors.grey.shade500
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Header widget (arrow back, title, Done)
  Widget _buildHeader(bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 12),
      decoration: BoxDecoration(
        color: isDark
            ? backgroundDark.withOpacity(0.95)
            : backgroundLight.withOpacity(0.95),
        // mimic backdrop-blur by slight shadow
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconCircleButton(
            icon: Icons.arrow_back,
            isDark: isDark,
            onTap: () {
              Navigator.maybePop(context);
            },
          ),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: TextStyle(color: primary, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // profile card
  Widget _buildProfileCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? surfaceAltDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(2, 6, 23, 0.03),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // avatar
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(19, 236, 164, 0.06),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                    border: Border.all(
                      color: isDark ? backgroundDark : backgroundLight,
                      width: 4,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      avatarUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              // edit button at bottom-right of avatar
              Positioned(
                right: 0,
                bottom: 4,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.24),
                          blurRadius: 8,
                        ),
                      ],
                      border: Border.all(
                        color: isDark ? backgroundDark : backgroundLight,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: isDark ? backgroundDark : Colors.black,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Alex Johnson',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'alex.johnson@example.com',
            style: TextStyle(
              fontSize: 13,
              color: isDark ? textSecondary : Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? surfaceHighlight
                    : Colors.grey.shade100,
                foregroundColor: isDark ? Colors.white : Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Manage Account',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // small section label
  Widget _buildSectionLabel(String text, bool isDark) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 6, bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          color: isDark ? textSecondary : Colors.grey.shade700,
        ),
      ),
    );
  }

  // card container to mimic rounded cards with ring/shadow
  Widget _buildCardContainer(bool isDark, {required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? surfaceAltDark : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(2, 6, 23, 0.03),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.03) : Colors.transparent,
          width: 0.5,
        ),
      ),
      child: Column(children: children),
    );
  }

  // standard divider used in HTML (with left padding area)
  Widget _divider(bool isDark) {
    return Container(
      height: 1,
      color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade100,
      margin: const EdgeInsets.only(left: 68.0),
    );
  }

  // small circular icon background + title row with trailing chevron or custom trailing
  Widget _buildClickableRow(
    bool isDark, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
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
            Icon(
              Icons.chevron_right,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  // clickable row but with trailing text and optional trailing icon (like sync)
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

  // build row with switch at trailing
  Widget _buildRowWithSwitch(
    bool isDark, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required bool switchValue,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: isDark ? surfaceHighlight : iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: isDark ? primary : iconColor, size: 20),
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
          // custom-styled switch that matches the primary color when on
          Transform.scale(
            scale: 0.9,
            child: Switch(
              value: switchValue,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: primary,
              inactiveTrackColor: isDark
                  ? surfaceHighlight.withOpacity(0.7)
                  : Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }

  // small circle button used for header left
  Widget _iconCircleButton({
    required IconData icon,
    required bool isDark,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 38,
        height: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 22,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
