import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Presentation/Pages/firebase_options.dart';
import 'Presentation/Pages/SplashScreenpage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...

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