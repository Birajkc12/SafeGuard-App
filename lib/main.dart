import 'package:flutter/material.dart';
import 'package:safeguard_app/onboarding_Page.dart';
import 'package:safeguard_app/view/main_tabview/main_tabview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeGuard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingView(),
        '/main': (context) => const MainTabView(),
      },
    );
  }
}
