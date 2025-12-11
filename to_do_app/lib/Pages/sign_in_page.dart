import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSignInSelected = true;
  bool passwordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Color _primaryColor() => const Color(0xFF13ECA4);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundLight = const Color(0xFFF6F8F7);
    final backgroundDark = const Color(0xFF10221c);
    final surfaceDark = const Color(0xFF1C2E28);

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: isDark ? backgroundDark : backgroundLight,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.08),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () => Navigator.maybePop(context),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.arrow_back,
                              size: 26,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'To-Do',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),

                  // Header image & title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuBax5oRiPBFoXt_6q6cGUl0M6FKVC623vgJLH1cDUOJlLxVZqgQOIHQ6fTCps6BkQjrMvtriEdij_79EhlJipmLtfrSPZjHw9GLfZZr-yU5aoQGD5lageZ4BcrsYo5RK5-Amr47OwIvdMYS6dmLbBp58IoLfAfv1lsI55GE6psTg-7HdBipn9jrMOIprbInGfYEz2bksz5isCcuHSHeUVTjrDDP7B3jK0xkVOoFPqjq264UMZp0ZusC7DMjIHBjo1yqaf6ddOs8Giee",
                              ),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _primaryColor().withOpacity(0.06),
                                blurRadius: 24,
                                spreadRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // dark gradient overlay for readability
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    gradient: LinearGradient(
                                      colors: [
                                        isDark
                                            ? backgroundDark.withOpacity(0.9)
                                            : Colors.black.withOpacity(0.22),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 14,
                                bottom: 16,
                                right: 14,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Get things done.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Your productivity journey starts here.',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.85),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Toggle (Segmented control)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isDark ? surfaceDark : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => isSignInSelected = true),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isSignInSelected
                                      ? (isDark
                                            ? _primaryColor()
                                            : Colors.white)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: isSignInSelected
                                          ? (isDark
                                                ? Colors.black
                                                : Colors.black87)
                                          : (isDark
                                                ? Colors.white70
                                                : Colors.grey[600]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => isSignInSelected = false),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: !isSignInSelected
                                      ? Colors.transparent
                                      : null,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: !isSignInSelected
                                          ? (isDark
                                                ? Colors.white70
                                                : Colors.grey[600])
                                          : (isDark
                                                ? Colors.black
                                                : Colors.black87),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Form fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        // Email
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'name@example.com',
                                prefixIcon: const Icon(Icons.mail_outline),
                                filled: true,
                                fillColor: isDark ? surfaceDark : Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: isDark
                                        ? Colors.transparent
                                        : Colors.grey.shade200,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: _primaryColor().withOpacity(0.9),
                                    width: 1.6,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // Password
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? Colors.white70
                                        : Colors.black87,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    // handle forgot password
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(48, 24),
                                  ),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: _primaryColor(),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: passwordController,
                              obscureText: !passwordVisible,
                              decoration: InputDecoration(
                                hintText: '••••••••',
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () => setState(
                                    () => passwordVisible = !passwordVisible,
                                  ),
                                ),
                                filled: true,
                                fillColor: isDark ? surfaceDark : Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: isDark
                                        ? Colors.transparent
                                        : Colors.grey.shade200,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: _primaryColor().withOpacity(0.9),
                                    width: 1.6,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        // Primary action
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              // handle sign in / sign up action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _primaryColor(),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              shadowColor: _primaryColor().withOpacity(0.28),
                              elevation: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isSignInSelected ? 'Sign In' : 'Sign Up',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Divider with text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: isDark
                                ? Colors.grey.shade700
                                : Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Or continue with',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? Colors.white70
                                : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Divider(
                            color: isDark
                                ? Colors.grey.shade700
                                : Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Social buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // apple sign in
                            },
                            icon: const Icon(Icons.apple, size: 18),
                            label: Text(
                              'Apple',
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: isDark
                                  ? surfaceDark
                                  : Colors.white,
                              foregroundColor: isDark
                                  ? Colors.white
                                  : Colors.black87,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: isDark
                                      ? Colors.transparent
                                      : Colors.grey.shade200,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // google sign in
                            },
                            icon: const Icon(Icons.g_mobiledata, size: 18),
                            label: Text(
                              'Google',
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: isDark
                                  ? surfaceDark
                                  : Colors.white,
                              foregroundColor: isDark
                                  ? Colors.white
                                  : Colors.black87,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: isDark
                                      ? Colors.transparent
                                      : Colors.grey.shade200,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey.shade700,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                      textAlign: TextAlign.center,
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
}
