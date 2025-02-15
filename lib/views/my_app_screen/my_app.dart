import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import '../../config/all_providers.dart';
import '../../services/internet_conectivity_checker.dart';
import '../../utils/helper/languageSelection/Provider/languageSelection_provider.dart';
import '../../utils/helper/theme/theme_provider.dart';
import '../../utils/routing.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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


          );
        }),
      ),
    );
  }
}
