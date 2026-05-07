import 'package:dramaskin/Home/Home.dart';
import 'package:dramaskin/auth/Login.dart';
import 'package:dramaskin/shop/mainshop.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _buttonFadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _buttonFadeAnimation = CurvedAnimation(
      parent: _slideController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
    );

    // Staggered animation sequence
    _fadeController.forward();
    _scaleController.forward();
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFDE8F0), Color(0xFFF8D7E8), Color(0xFFFCE4EE)],
          ),
        ),
        child: Stack(
          children: [
            // Decorative background circles
            Positioned(
              top: -40,
              right: -40,
              child: _DecorativeCircle(
                size: 160,
                color: const Color(0xFFD4A0C0).withOpacity(0.35),
              ),
            ),
            Positioned(
              bottom: -30,
              left: -50,
              child: _DecorativeCircle(
                size: 180,
                color: const Color(0xFFC89BC0).withOpacity(0.3),
              ),
            ),
            Positioned(
              bottom: 100,
              right: -20,
              child: _DecorativeCircle(
                size: 80,
                color: const Color(0xFFE8B4D0).withOpacity(0.4),
              ),
            ),

            // Main content
            SafeArea(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),

                    // Logo with concentric circles
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: const _LogoSection(),
                    ),

                    const SizedBox(height: 36),

                    // Brand text
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _buttonFadeAnimation,
                        child: const _BrandText(),
                      ),
                    ),

                    const Spacer(flex: 2),

                    // Buttons
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _buttonFadeAnimation,
                        child: const _ButtonSection(),
                      ),
                    ),

                    const SizedBox(height: 52),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _DecorativeCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer ring
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFEFC5DB).withOpacity(0.5),
            ),
          ),
          // Middle ring
          Container(
            width: 168,
            height: 168,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE8B0D0).withOpacity(0.55),
            ),
          ),
          // Inner white circle with lotus
          Container(
            width: 110,
            height: 110,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1FD090B8),
                  blurRadius: 16,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                "assets/logo-removebg-preview 2.png",
                fit: BoxFit.cover,
                width: 400,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandText extends StatelessWidget {
  const _BrandText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Brand name in cursive-style
        Text(
          'DermaSkin',
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 38,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Color(0xFFB03070), Color(0xFFD060A0)],
              ).createShader(const Rect.fromLTWH(0, 0, 220, 50)),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        // Tagline
        const Text(
          'Know Your Skin. Love Your Skin.',
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 13.5,
            color: Color(0xFFA06080),
            letterSpacing: 0.3,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          // Get Started - filled button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8609A), Color(0xFFD040808)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE060A0).withOpacity(0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Explore First - outlined button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>mainShop()));
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE060A0), width: 1.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                'Explore First',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE060A0),
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
