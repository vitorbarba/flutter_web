import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/bindings/authBinding.dart';
import 'package:todolist/utils/translation_service.dart';
import 'package:todolist/utils/root.dart';

bool useFirestoreEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (useFirestoreEmulator) {
    FirebaseFirestore.instance.settings = const Settings(
        host: 'localhost:5000', sslEnabled: false, persistenceEnabled: false);
  }
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      initialBinding: AuthBinding(),
      home: Root(),
      theme: !Get.isPlatformDarkMode ? ThemeData.dark() : ThemeData.light(),
      title: 'ToDo_List'.tr,
    );
  }
}
