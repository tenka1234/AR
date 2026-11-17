import 'dart:async';
import 'package:flutter/material.dart';

import 'splash_screen.dart';

/// Full-screen static 9:16 Madhavani Studios presentation screen.
/// Renders completely static on pure black (#000000) with no zooming,
/// scaling, or movement, then transitions into the custom game splash screen.
class StudioSplashScreen extends StatefulWidget {
  const StudioSplashScreen({super.key});

  @override
  State<StudioSplashScreen> createState() => _StudioSplashScreenState();
}

class _StudioSplashScreenState extends State<StudioSplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1000), _transitionToGameSplash);
  }

  void _transitionToGameSplash() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Image.asset(
          'assets/splash/madhavani_splash.png',
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
