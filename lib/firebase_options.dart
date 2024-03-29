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
    apiKey: 'AIzaSyBc07e77I0RVRprHXswRNtGE_c9BwQYncU',
    appId: '1:910035644904:web:0b5d04790b7cdca34e345d',
    messagingSenderId: '910035644904',
    projectId: 'list-firestore-ulist',
    authDomain: 'list-firestore-ulist.firebaseapp.com',
    storageBucket: 'list-firestore-ulist.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpSJrryUNmHER3tCR-8WWuOYPsz0HLZtc',
    appId: '1:910035644904:android:e7054a7795b00d2f4e345d',
    messagingSenderId: '910035644904',
    projectId: 'list-firestore-ulist',
    storageBucket: 'list-firestore-ulist.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5QgL0i7duHu9H4oAQZLcpu1HAox2pn6A',
    appId: '1:910035644904:ios:79b3d8f4246ed21d4e345d',
    messagingSenderId: '910035644904',
    projectId: 'list-firestore-ulist',
    storageBucket: 'list-firestore-ulist.appspot.com',
    iosBundleId: 'com.example.listFirestore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5QgL0i7duHu9H4oAQZLcpu1HAox2pn6A',
    appId: '1:910035644904:ios:0652e96e184d22414e345d',
    messagingSenderId: '910035644904',
    projectId: 'list-firestore-ulist',
    storageBucket: 'list-firestore-ulist.appspot.com',
    iosBundleId: 'com.example.listFirestore.RunnerTests',
  );
}
