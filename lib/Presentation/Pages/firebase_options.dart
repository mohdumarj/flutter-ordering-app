// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;



/*
* Platform  Firebase App Id
web       1:74908638122:web:72184d4ae33756e1a729d3
android   1:74908638122:android:a14ae320600bd6fda729d3
ios       1:74908638122:ios:54c1ad6c66b2dfbca729d3
macos     1:74908638122:ios:54c1ad6c66b2dfbca729d3
windows   1:74908638122:web:c8d0e4cf4fb588eea729d3
* */
/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUJ5wIQMsH7xT2hD5guLv7l39KQk1eq5s',
    appId: '1:74908638122:web:72184d4ae33756e1a729d3',
    messagingSenderId: '74908638122',
    projectId: 'flutter-ordering-app-main',
    authDomain: 'flutter-ordering-app-main.firebaseapp.com',
    storageBucket: 'flutter-ordering-app-main.appspot.com',
    measurementId: 'G-85TSJSW368',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsrwEoaLFzrgfdwBwP3Ao_R1ezhtIfdvo',
    appId: '1:74908638122:android:a14ae320600bd6fda729d3',
    messagingSenderId: '74908638122',
    projectId: 'flutter-ordering-app-main',
    storageBucket: 'flutter-ordering-app-main.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPjoittFQBAa2YA9oi8-99JtEc4TcWtME',
    appId: '1:74908638122:ios:54c1ad6c66b2dfbca729d3',
    messagingSenderId: '74908638122',
    projectId: 'flutter-ordering-app-main',
    storageBucket: 'flutter-ordering-app-main.appspot.com',
    iosBundleId: 'com.Ammar.QickServe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPjoittFQBAa2YA9oi8-99JtEc4TcWtME',
    appId: '1:74908638122:ios:54c1ad6c66b2dfbca729d3',
    messagingSenderId: '74908638122',
    projectId: 'flutter-ordering-app-main',
    storageBucket: 'flutter-ordering-app-main.appspot.com',
    iosBundleId: 'com.Ammar.QickServe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUJ5wIQMsH7xT2hD5guLv7l39KQk1eq5s',
    appId: '1:74908638122:web:c8d0e4cf4fb588eea729d3',
    messagingSenderId: '74908638122',
    projectId: 'flutter-ordering-app-main',
    authDomain: 'flutter-ordering-app-main.firebaseapp.com',
    storageBucket: 'flutter-ordering-app-main.appspot.com',
    measurementId: 'G-7P66ZMMSG6',
  );

}