import 'package:flutter/material.dart';
import 'package:flutter_goodcook/screens/edit_profile.dart';
import 'screens/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Login(),
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,

      initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build login page.
          '/': (context) => const Login(),
          // When navigating to the "/second" route, build edit profile page.
          '/edit_profile': (context) => const EditProfilePage(),
        }
    );
  }
}
