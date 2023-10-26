import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'Parece que houve um problema com a configuração do DefaultFirebaseOptions para IOS. '
          'Para resolver isso, recomenda-se reconfigurar o DefaultFirebaseOptions executando novamente a CLI do FlutterFire.',
        );
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'Parece que houve um problema com a configuração do DefaultFirebaseOptions para Windows.'
          'Para resolver isso, recomenda-se reconfigurar o DefaultFirebaseOptions executando novamente a CLI do FlutterFire.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'Parece que houve um problema com a configuração do DefaultFirebaseOptions para Linux.'
          'Para resolver isso, recomenda-se reconfigurar o DefaultFirebaseOptions executando novamente a CLI do FlutterFire.',
        );
      default:
        throw UnsupportedError(
          'Essa plataforma não suporta o DefaultFirebaseOptions.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDqs9_tGfYFlUAWOfkSY1FsDVKXzqIj94k',
    appId: '1:632827762919:web:60c70133b0714eff726a42',
    messagingSenderId: '632827762919',
    projectId: 'passeio-aumigo',
    authDomain: 'passeio-aumigo.firebaseapp.com',
    databaseURL: 'https://passeio-aumigo-default-rtdb.firebaseio.com',
    storageBucket: 'passeio-aumigo.appspot.com',
    measurementId: 'G-3W2N07DFPT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuAfDeQg322RdZH6u5WnVgFDjuhgnVI5w',
    appId: '1:632827762919:android:2e8d4967b46c78ab726a42',
    messagingSenderId: '632827762919',
    projectId: 'passeio-aumigo',
    databaseURL: 'https://passeio-aumigo-default-rtdb.firebaseio.com',
    storageBucket: 'passeio-aumigo.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJSul9n4b41Cc6aMyPNyyz3dWfXtV4H84',
    appId: '1:632827762919:ios:343bb6313e7182b9726a42',
    messagingSenderId: '632827762919',
    projectId: 'passeio-aumigo',
    databaseURL: 'https://passeio-aumigo-default-rtdb.firebaseio.com',
    storageBucket: 'passeio-aumigo.appspot.com',
    iosBundleId: 'com.example.passeioAumigo.RunnerTests',
  );
}
