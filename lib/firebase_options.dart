import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

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
  static const FirebaseOptions currentPlatform = FirebaseOptions(
    apiKey: 'AIzaSyA6DzyXSTmQwIYCgukDv572s_wrLTwWvew',
    appId: '1:904168745775:web:89b3a3ea0efa65b3ef8fda',
    messagingSenderId: '904168745775',
    projectId: 'utsflutter-b921a',
    authDomain: 'utsflutter-b921a.firebaseapp.com',
    storageBucket: 'utsflutter-b921a.appspot.com',
    measurementId: 'G-M0YVC6GCTD',
  );
}
