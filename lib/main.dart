import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/splashscreen.dart';
import 'package:dicee/providers/chats_provider.dart';
import 'package:dicee/providers/models_provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Splash Screen Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF19191B),
          primaryColor: Color(0xFF19191B),
        ),
        home: SplashScreen(),
      ),
    );
  }
}





