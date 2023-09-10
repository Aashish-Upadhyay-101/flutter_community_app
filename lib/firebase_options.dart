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
    apiKey: 'AIzaSyATlfXMwpDt_98xxKg0N5UxwkpUYyd1ogw',
    appId: '1:880556040158:web:ec7f8dbc9ca76462aac74f',
    messagingSenderId: '880556040158',
    projectId: 'flutter-reddit-clone-24599',
    authDomain: 'flutter-reddit-clone-24599.firebaseapp.com',
    storageBucket: 'flutter-reddit-clone-24599.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_HzJJIweFVPhF1TUrFTpDRBzAOfey5h8',
    appId: '1:880556040158:android:638227e35ec227c7aac74f',
    messagingSenderId: '880556040158',
    projectId: 'flutter-reddit-clone-24599',
    storageBucket: 'flutter-reddit-clone-24599.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3lz0D8qiAXUVytK1r-moHx5y6D1Wo-Qc',
    appId: '1:880556040158:ios:b4d400a81489a97daac74f',
    messagingSenderId: '880556040158',
    projectId: 'flutter-reddit-clone-24599',
    storageBucket: 'flutter-reddit-clone-24599.appspot.com',
    iosClientId: '880556040158-m3csmne93cj3cueap2oef4ujh2toaha9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterRedditClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3lz0D8qiAXUVytK1r-moHx5y6D1Wo-Qc',
    appId: '1:880556040158:ios:2ee8379677c7f005aac74f',
    messagingSenderId: '880556040158',
    projectId: 'flutter-reddit-clone-24599',
    storageBucket: 'flutter-reddit-clone-24599.appspot.com',
    iosClientId: '880556040158-etvinpvnkb6johbjcj4qp0ak046662sf.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterRedditClone.RunnerTests',
  );
}
