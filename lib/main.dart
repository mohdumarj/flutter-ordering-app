import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'ForgotPasswordPage.dart';
import 'SplashScreenpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuickServeApp());
}
class QuickServeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'QuickServe',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}