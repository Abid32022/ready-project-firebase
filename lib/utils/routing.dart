import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_qurbani/views/auth/sign_up/sign_up_screen.dart';
import 'package:my_qurbani/views/dashboard/categories_screen.dart';
import 'package:my_qurbani/views/languageSelection/language_selection.dart';
import 'package:my_qurbani/views/theme/theme_screen.dart';
import '../views/auth/login_screen/login_screen.dart';
import '../views/auth/splash_screen/splash_screen.dart';
import '../views/firebase_notification/notification_screen.dart';
import '../views/google_sign_in/google_signin_screen.dart';
import '../views/test/chat_app_sockets.dart';
import '../views/test/enum_test/enum_main_class.dart';
import '../views/test/isolate_class.dart';
import '../views/test/login_screen_test.dart';
import '../views/test/url_launcher.dart';
import '../views/test/url_launcher_screen.dart';
import '../views/test/web_sockets.dart';

class AppRoute{
  static final GoRouter router = GoRouter(routes:  [

    GoRoute(
      path: "/",
      pageBuilder: (context, state)=>MaterialPage(child: UrlLauncherScreen()),
    ),

    // GoRoute(
    //   path: "/",
    //   pageBuilder: (context, state)=>MaterialPage(child: WebSocketExample()),
    // ),

    GoRoute(
      path: "/SignupScreen",
      pageBuilder: (context, state)=>MaterialPage(child: SignUpScreen()),
    ),
    GoRoute(
      path: "/SignInScreen",
      pageBuilder: (context, state)=>MaterialPage(child: SignInScreen()),
    ),
    GoRoute(
      path: "/LanguageSelection",
      pageBuilder: (context, state)=>MaterialPage(child: LanguageSelectionScreen()),
    ),
    GoRoute(
      path: "/CategoryScreen",
      pageBuilder: (context, state)=>MaterialPage(child: CategoryScreen()),
    ),
    GoRoute(
      path: "/LightDarkThemeScreen",
      pageBuilder: (context, state)=>MaterialPage(child: LightDarkThemeScreen()),
    ),
    GoRoute(
      path: "/IsolateScreen",
      pageBuilder: (context, state)=>MaterialPage(child: IsolateScreen()),
    ),

    // GoRoute(
    //   name: '/GetStarted',
    //   path: "/GetStarted",
    //   builder: (context,state){
    //     return GetStarted();
    //   },
    //   // pageBuilder: (context, state)=>MaterialPage(child: GetStarted())
    // ),

  ]
);}
