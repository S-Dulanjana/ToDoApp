import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/create_account_page.dart';
import 'package:to_do_app/Pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DoIt App",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF13ECA4),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Inter',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF13ECA4),
        scaffoldBackgroundColor: const Color(0xFF051918), // dark greenish-black
        fontFamily: 'Inter',
      ),
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LOGO
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check_circle, color: Color(0xFF13ECA4), size: 36),
                  SizedBox(width: 8),
                  Text(
                    "DoIt",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // HERO IMAGE + TEXT
              Column(
                children: [
                  // Hero Image Container
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.tealAccent.withOpacity(0.2),
                          blurRadius: 40,
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

                  // Heading & Subtitle
                  Text(
                    "Master Your Day",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.tealAccent.withOpacity(0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Capture ideas, manage projects, and check off your daily goals effortlessly.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),

              // Buttons
              Column(
                children: [
                  // Get Started
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
                        shadowColor: Colors.tealAccent.withOpacity(0.5),
                        elevation: 8,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Sign In
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey.shade300,
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
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
