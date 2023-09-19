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
    apiKey: 'AIzaSyDykXLHrIuvI2mUjdKSMVGp-SfymJr4QsY',
    appId: '1:512661116730:web:97d5437236b8d11bf1e203',
    messagingSenderId: '512661116730',
    projectId: 'chatapp-3bf0b',
    authDomain: 'chatapp-3bf0b.firebaseapp.com',
    storageBucket: 'chatapp-3bf0b.appspot.com',
    measurementId: 'G-DB7M25EMV4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeIG2vadPlmuWXGuL06INhcyMkzLFajZw',
    appId: '1:512661116730:android:78692647b72e41a3f1e203',
    messagingSenderId: '512661116730',
    projectId: 'chatapp-3bf0b',
    storageBucket: 'chatapp-3bf0b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYHadHTO3WUUHKibfkoMcugBSaaELby5U',
    appId: '1:512661116730:ios:e49c8daf79164832f1e203',
    messagingSenderId: '512661116730',
    projectId: 'chatapp-3bf0b',
    storageBucket: 'chatapp-3bf0b.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYHadHTO3WUUHKibfkoMcugBSaaELby5U',
    appId: '1:512661116730:ios:b200258bf15b304bf1e203',
    messagingSenderId: '512661116730',
    projectId: 'chatapp-3bf0b',
    storageBucket: 'chatapp-3bf0b.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}