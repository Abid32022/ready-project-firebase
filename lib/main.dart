import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_qurbani/utils/helper/languageSelection/Provider/languageSelection_provider.dart';
import 'package:my_qurbani/utils/helper/setup_locator.dart';
import 'package:my_qurbani/views/my_app_screen/my_app.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Sentry
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://f7938180402537b7255af19060a049fb@o4508647231127552.ingest.us.sentry.io/4508647236632576';
      options.tracesSampleRate = 1.0; // Adjust in production
      options.profilesSampleRate = 1.0; // Adjust profiling rate
    },
    appRunner: () async {
      setupLocator();
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      runApp(MyApp(),

      );
    },
  );
}


