import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Globals/Common/Globals.dart';

import 'Presentation/Pages/SplashScreenpage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Globals().AppInit();
  runApp(QuickServeApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(QuickServeApp());
// }
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
