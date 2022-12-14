// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB87buC6M38Jr5LzIXChlBUMt4bDe7ucY8',
    appId: '1:956150980767:web:5fab0397d37753882082aa',
    messagingSenderId: '956150980767',
    projectId: 'eelspaceapp',
    authDomain: 'eelspaceapp.firebaseapp.com',
    storageBucket: 'eelspaceapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0LQUb6F5tgwkAmlIDUALCJGEHVmD970E',
    appId: '1:956150980767:android:a81d605042a6cc1d2082aa',
    messagingSenderId: '956150980767',
    projectId: 'eelspaceapp',
    storageBucket: 'eelspaceapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-A5QXTCUyTbEwUMtnF0N6DNf95CZpisc',
    appId: '1:956150980767:ios:093bec0b4d4000b92082aa',
    messagingSenderId: '956150980767',
    projectId: 'eelspaceapp',
    storageBucket: 'eelspaceapp.appspot.com',
    iosClientId:
        '956150980767-4egp1092rcj9r379eflj21vvba7of4d4.apps.googleusercontent.com',
    iosBundleId: 'com.example.issue24',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-A5QXTCUyTbEwUMtnF0N6DNf95CZpisc',
    appId: '1:956150980767:ios:093bec0b4d4000b92082aa',
    messagingSenderId: '956150980767',
    projectId: 'eelspaceapp',
    storageBucket: 'eelspaceapp.appspot.com',
    iosClientId:
        '956150980767-4egp1092rcj9r379eflj21vvba7of4d4.apps.googleusercontent.com',
    iosBundleId: 'com.example.issue24',
  );
}
