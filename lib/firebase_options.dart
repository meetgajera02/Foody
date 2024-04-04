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
    apiKey: 'AIzaSyBWS2KyBL9AsjwbkrNoTKmiVaszdKVYdtE',
    appId: '1:251660678468:web:2664eea02f3d2852bf5311',
    messagingSenderId: '251660678468',
    projectId: 'food-66ea4',
    authDomain: 'food-66ea4.firebaseapp.com',
    storageBucket: 'food-66ea4.appspot.com',
    measurementId: 'G-T2HF6JK9K4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpIuITVfqEzUF9kXwCdajaMw2QD51KAS0',
    appId: '1:251660678468:android:572211e9ad16f64ebf5311',
    messagingSenderId: '251660678468',
    projectId: 'food-66ea4',
    storageBucket: 'food-66ea4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5bNJNPkmkgI0uzPEcFcI4D6C4Tfb29CQ',
    appId: '1:251660678468:ios:8e532541801c3f18bf5311',
    messagingSenderId: '251660678468',
    projectId: 'food-66ea4',
    storageBucket: 'food-66ea4.appspot.com',
    iosBundleId: 'com.example.foody',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5bNJNPkmkgI0uzPEcFcI4D6C4Tfb29CQ',
    appId: '1:251660678468:ios:f3d091fe15616d59bf5311',
    messagingSenderId: '251660678468',
    projectId: 'food-66ea4',
    storageBucket: 'food-66ea4.appspot.com',
    iosBundleId: 'com.example.foody.RunnerTests',
  );
}
