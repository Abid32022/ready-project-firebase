import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_qurbani/config/all_providers.dart';
import 'package:my_qurbani/services/internet_conectivity_checker.dart';
import 'package:my_qurbani/utils/helper/setup_locator.dart';
import 'package:my_qurbani/utils/routing.dart';
import 'package:my_qurbani/views/custom_widgets/custom_button.dart';
import 'package:my_qurbani/views/custom_widgets/no_internet_screen.dart';
import 'package:my_qurbani/views/languageSelection/Provider/languageSelection_provider.dart';
import 'package:my_qurbani/views/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

//localization
//theming
//custom buttons and custom textfield
//go route
//placeholer cahed image
//with image api hit like profile etc multipart

//flavours

//river pod and bloc
//firebase notification
//test file testing
//Api hit and screen navigation print  -- check it get repository app

//isLoading issue for every api

//app constant token if null or empty
// single image and multiple image or with video api
// during development CI/CD unit testing /code magic
//isloading in button parameter for both android and ios
//appexcenptions
//isolates screen

//multiple api same fucntion loading variable checking.
//pagination code

// filter search
//refresh indicator
//no internet screen for all screen separatly.
//snack bar
//spinkit for whole screen
//gridview.builder animation of list and listview builder
//screen to screen animation small one
// whole screen indicator widget
// RSizedBox from tresorly

// profile api of myqurbani
// permission handler in both ios and android
// app store upload way
// payment method

//google sign in with apple and android , facebook ,apple code
// split image according to api function
//enums and its use and benefits and externsion
//switch case best use

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   setupLocator();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   runApp(ChangeNotifierProvider(
//     create: (_) => LanguageChangeController(),
//     child: MyApp(),
//   ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Sentry
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://f7938180402537b7255af19060a049fb@o4508647231127552.ingest.us.sentry.io/4508647236632576';
      options.tracesSampleRate = 1.0; // Adjust in production
      options.profilesSampleRate = 1.0; // Adjust profiling rate
    },
    // Run your app inside the appRunner to capture any initialization errors
    appRunner: () async {
      setupLocator();
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      runApp(
        ChangeNotifierProvider(
          create: (_) => LanguageChangeController(),
          child:  MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late ConnectivityService _connectivityService;
  bool _hasInternet = true;

  @override
  void initState() {
    super.initState();
    _connectivityService = ConnectivityService();
    _connectivityService.connectivityStream.listen((hasInternet) {
      setState(() {
        _hasInternet = hasInternet;
      });
    });
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: AppAllProviders.appAllProviders,
        child: Consumer<LanguageChangeController>(builder: (context,provider,child) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return Platform.isIOS ?  CupertinoApp.router(
            theme: CupertinoThemeData(
              brightness: themeChanger.themeMode == ThemeMode.dark
                  ? Brightness.dark
                  : Brightness.light,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routerDelegate: AppRoute.router.routerDelegate,
            routeInformationProvider: AppRoute.router.routeInformationProvider,
            routeInformationParser: AppRoute.router.routeInformationParser,
            locale: provider.applocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('es'),
            ],
          ):
            GetMaterialApp.router(
              themeMode:Provider.of<ThemeChangerProvider>(context).themeMode,
              // themeChanger.themeMode,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              routerDelegate: AppRoute.router.routerDelegate,
              routeInformationProvider: AppRoute.router.routeInformationProvider,
              routeInformationParser: AppRoute.router.routeInformationParser,
              locale: provider.applocale ,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale('es'),
              ],

              // builder: (context, child) {
              //   if (!_hasInternet) {
              //     return NoInternetScreen(); // Show No Internet Screen
              //   }
              //   return child!;
              // } +92213647000311
              //0213647003445464748


              );
        }),
      ),
    );
  }
}

