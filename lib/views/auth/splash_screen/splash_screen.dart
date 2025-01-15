import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_qurbani/views/custom_widgets/no_internet_screen.dart';
import 'package:provider/provider.dart';
import '../../../config/app_constant.dart';
import '../../../services/internet_conectivity_checker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../services/shared_preference_service.dart';
import '../../../utils/helper/setup_locator.dart';
import '../../../utils/local_provider.dart';
import '../../firebase_notification/notification_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///firebase notification
    // notificationServices.requestNotificationPermission();
    // notificationServices.forgroundMessage();
    // notificationServices.firebaseInit(context);
    // notificationServices.setupInteractMessage(context);
    // notificationServices.isTokenRefresh();
    // notificationServices.getDeviceToken().then((value){
    //   if (kDebugMode) {
    //     print('device token');
    //     print(value);
    //   }});
    ///firebase notification

    // LocalProvider localProvider = Provider.of<LocalProvider>(context, listen: false);
    // localProvider.getUserToken();

    locator.get<LocalProvider>().getUserToken();

    print("This is token ========>> ${AppConstants.getToken}");
    Timer(const Duration(seconds: 3), () {
      if(AppConstants.getToken.isEmpty){
        context.push('/SignInScreen');
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (context) => const GettingStarted()),
        //       (Route<dynamic> route) => false,
        // );
      } else {
        print('HomeScreen');
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        //       (Route<dynamic> route) => false,
        // );
      }
    });


  }



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            // Text(AppLocalizations.of(context)!.hello),/
            MaterialButton(
                color: Colors.red,
                onPressed: (){
              context.push('/LightDarkThemeScreen');
              // context.push('/SignupScreen');
            })
          ],
        ),
      ),
    );
  }
}
