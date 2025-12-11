import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/create_account_page.dart';
import 'package:to_do_app/Pages/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF10221c)
          : const Color(0xFFF6F8F7),

      body: Stack(
        children: [
          // BACKGROUND GLOW TOP LEFT
          Positioned(
            top: -60,
            left: -40,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF13ECA4).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // BACKGROUND GLOW BOTTOM RIGHT
          Positioned(
            bottom: -60,
            right: -40,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF13ECA4).withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // MAIN CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 20),

                  // LOGO SECTION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFF13ECA4),
                        size: 36,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "DoIt",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // HERO IMAGE + TEXT
                  Column(
                    children: [
                      // HERO IMAGE
                      Container(
                        height: 300,
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF13ECA4).withOpacity(0.08),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://lh3.googleusercontent.com/aida-public/AB6AXuALBgekq0PIFOlrTHmyFKneDG5knmJF8S2r1LiCpvBOY27MP5ENYw2gNivNZmRy7axFvHtK8bDuNa672IBrByu3UOvJRsf4diosJ4CIVs7NGOvzNwNcIrpXEotlm59SArE0J2u41_d95C-LExKbLEoa5M7Nc8NeLJMNYdO_qKnyO0BpjoqJSFaawW2Dt0ctOofhwWWRRmmKHUDPjAOQQB-0UyB8JFW-BIHJlfQuVNwDNerqdEN9XhYmQRZmfjxJ-ISY-zZAgpcWrx4X",
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // TEXT BLOCK
                      Column(
                        children: [
                          Text(
                            "Master Your Day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: isDark
                                  ? Colors.white
                                  : Colors.grey.shade900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Capture ideas, manage projects, and check off your daily goals effortlessly.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              color: isDark
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // BUTTONS
                  Column(
                    children: [
                      // GET STARTED BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF13ECA4),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateAccountScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, size: 20),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // SIGN IN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: isDark
                                ? Colors.grey.shade300
                                : Colors.grey.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Already have an account? Sign In",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
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
