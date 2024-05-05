import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:AmmarQiuckServe/Globals/Common/Globals.dart';
import 'Presentation/Pages/firebase_options.dart';
import 'Presentation/Pages/SplashScreenpage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Globals().AppInit();
  runApp(const QuickServeApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(QuickServeApp());
// }
class QuickServeApp extends StatelessWidget {
  const QuickServeApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'QuickServe',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}