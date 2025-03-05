import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoptreo_v1/Screens/Auth/login.dart';
import 'package:shoptreo_v1/Screens/Onboarding/onboardingScreen.dart';
import 'package:shoptreo_v1/Screens/layout/home.dart';
import 'package:shoptreo_v1/Screens/layout/router.dart';
import 'package:shoptreo_v1/provider/product_provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => ProductProvider(),
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/routing": (context) => const Routing()
      },
    );
  }
}