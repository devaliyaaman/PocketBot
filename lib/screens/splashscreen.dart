import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';
import 'login_page.dart';
import 'package:dicee/components/poketbotText.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Check if the app was closed before
    SharedPreferences.getInstance().then((prefs) {
      bool closedBefore = prefs.getBool('closed_before') ?? false;
      prefs.setBool('closed_before', true);

      // Don't show splash screen if app was not closed before
      if (!closedBefore) {
        Timer(Duration(seconds: 0), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
          );
        });
        return;
      }

      _animationController.forward();

      Timer(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF19191B),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: PocketText(size: 45,),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}