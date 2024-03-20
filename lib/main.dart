import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';
import 'package:zip/routers/my_routers.dart';

import 'controller/update_user.dart';

Future<void> main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appVersion = packageInfo.version;
  print('app version is${appVersion.toString()}');
  runApp(const MyApp());
  checkForUpdate();
  getStoreVersion("com.zipFintech.zipe");
  checkForUpdates(context);
}

Future<String?> getStoreVersion(String myAppBundleId) async {
  // String? storeVersion;
  if (Platform.isAndroid) {
    PlayStoreSearchAPI playStoreSearchAPI = PlayStoreSearchAPI();
    Document? result =
        await playStoreSearchAPI.lookupById(myAppBundleId, country: 'US');
    if (result != null)
      controller.storeVersion = playStoreSearchAPI.version(result)!;
    log('PlayStore version:' + controller.storeVersion);
  } else if (Platform.isIOS) {
    ITunesSearchAPI iTunesSearchAPI = ITunesSearchAPI();
    Map<dynamic, dynamic>? result =
        await iTunesSearchAPI.lookupByBundleId(myAppBundleId, country: 'US');
    if (result != null)
      controller.storeVersion = iTunesSearchAPI.version(result)!;
    log('AppStore version: ' + controller.storeVersion);
  } else {
    controller.storeVersion = "";
  }
  return controller.storeVersion;
}

final controller = Get.put(registerController());
void checkForUpdates(context) async {
  String myAppBundleId = 'com.example.myapp'; // Replace with your app bundle ID
  String? storeVersion = await getStoreVersion(myAppBundleId);
  String currentVersion = '1.0.0'; // Replace with your current app version

  if (storeVersion != null && storeVersion.compareTo(currentVersion) > 0) {
    // New version available, show update dialog
    showUpdateDialog(context);
  }
}

void showUpdateDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: SizedBox(),
        content: ElevatedButton(
          onPressed: () {},
          child: SizedBox(),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Redirect user to the app store or play store for update
            },
            child: SizedBox(),
          ),
        ],
      );
    },
  );
}

Future<void> checkForUpdate() async {
  InAppUpdate.checkForUpdate().then((info) {
    String display = info.toString();
    print(display);
  });
}

// void checkForUpdates() async {
//   InAppUpdate.checkForUpdate().then((updateStatus) {
//     if (updateStatus.updateAvailable) {
//       InAppUpdate.performImmediateUpdate().catchError((e) {
//         // Handle error while performing update
//         print('Error while performing update: $e');
//       });
//     }
//   });
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: MyRouters.route,
    );
  }
}
