import 'package:flutter/material.dart';

// import '../HomePage.dart';
import '../Pages/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(child: Text('QuickServe', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white))),
    );
  }
}


@override
Widget build(BuildContext context) {
  return const Scaffold(
    backgroundColor: Colors.orange,
    body: Center(
      child: Text(
        'QuickServe',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: Image.asset('assets/logo.png'), // Your logo asset here
        ),
      ),
    );
  }
}
