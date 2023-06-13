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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcbgNq_rdZbYh23sO_3xoNOfq8YNs1iXg',
    appId: '1:666923002533:android:2c517d5233ad2cc8233b4c',
    messagingSenderId: '666923002533',
    projectId: 'soil-monitoring-system-e4988',
    databaseURL: 'https://soil-monitoring-system-e4988-default-rtdb.firebaseio.com',
    storageBucket: 'soil-monitoring-system-e4988.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDThWPodLa-CeEFLPUt2E0TH5lfbrwhzyI',
    appId: '1:666923002533:ios:080a581844d6d6cd233b4c',
    messagingSenderId: '666923002533',
    projectId: 'soil-monitoring-system-e4988',
    databaseURL: 'https://soil-monitoring-system-e4988-default-rtdb.firebaseio.com',
    storageBucket: 'soil-monitoring-system-e4988.appspot.com',
    androidClientId: '666923002533-tnojbjd61cer0k8tgd5u1ajmaqrem3gh.apps.googleusercontent.com',
    iosClientId: '666923002533-6d6j7htrh5fuadsfc1lhmrlcrtif8rd3.apps.googleusercontent.com',
    iosBundleId: 'com.example.soilApp',
  );
}