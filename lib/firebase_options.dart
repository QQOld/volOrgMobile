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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBndG7_t5b2ahJRlOGPkQIRe8TEFKvLyXs',
    appId: '1:683942923498:web:0d38109b4b92f987219b93',
    messagingSenderId: '683942923498',
    projectId: 'volorg-5d19a',
    authDomain: 'volorg-5d19a.firebaseapp.com',
    storageBucket: 'volorg-5d19a.appspot.com',
    measurementId: 'G-5RXPHW343X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbzsTHbgkqLi1N-SpAbMaBo-Lc8MMwoyQ',
    appId: '1:683942923498:android:414680f692d7673a219b93',
    messagingSenderId: '683942923498',
    projectId: 'volorg-5d19a',
    storageBucket: 'volorg-5d19a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAek0gp6x_G5ZbuyGbIVf7jIZUEooZFUbM',
    appId: '1:683942923498:ios:a4d94475c3be2c5c219b93',
    messagingSenderId: '683942923498',
    projectId: 'volorg-5d19a',
    storageBucket: 'volorg-5d19a.appspot.com',
    iosClientId: '683942923498-6rdr1s7uudr7gi0f9fte2o2pujd0kt2n.apps.googleusercontent.com',
    iosBundleId: 'com.example.volOrg',
  );
}