import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_qurbani/views/auth/sign_up/sign_up_screen.dart';
import 'package:my_qurbani/views/dashboard/categories_screen.dart';
import 'package:my_qurbani/views/languageSelection/language_selection.dart';
import 'package:my_qurbani/views/theme/theme_screen.dart';
import '../views/auth/login_screen/login_screen.dart';
import '../views/auth/splash_screen/splash_screen.dart';
import '../views/firebase_notification/message_screen.dart';
import '../views/firebase_notification/notification_screen.dart';
import '../views/google_sign_in/google_signin_screen.dart';
import '../views/test/chat_app_sockets.dart';
import '../views/test/enum_test/enum_main_class.dart';
import '../views/test/file_picker.dart';
import '../views/test/isolate_class.dart';
import '../views/test/login_screen_test.dart';
import '../views/test/pagination_http_s.dart';
import '../views/test/pagination_screen.dart';
import '../views/test/search_filter.dart';
import '../views/test/sentry_code_test.dart';
import '../views/test/url_launcher.dart';
import '../views/test/url_launcher_screen.dart';
import '../views/test/web_sockets.dart';

class AppRoute{
  static final GoRouter router = GoRouter(routes:  [
    GoRoute(
      path: "/",
            pageBuilder: (context, state)=>MaterialPage(child: FilterSearchTextfield()),
    ), GoRoute(
      path: "/FilterSearchTextfield",
            pageBuilder: (context, state)=>MaterialPage(child: FilterSearchTextfield()),
    ),
    GoRoute(
      path: "/PaginationHttpScreen",
      pageBuilder: (context, state)=>MaterialPage(child: PaginationHttpScreen()),
    ),  GoRoute(
      path: "/ChatScreenSockets",
      pageBuilder: (context, state)=>MaterialPage(child: ChatScreenSockets()),
    ),GoRoute(
      path: "/FilePickerApp",
      pageBuilder: (context, state)=>MaterialPage(child: FilePickerApp()),
    ),
   GoRoute(
      path: "/LoginScreenTest",
      pageBuilder: (context, state)=>MaterialPage(child: LoginScreenTest()),
    ),GoRoute(
      path: "/SentryCodeTest",
      pageBuilder: (context, state)=>MaterialPage(child: SentryCodeTest()),
    ),GoRoute(
      path: "/UrlLauncherScreen",
      pageBuilder: (context, state)=>MaterialPage(child: UrlLauncherScreen()),
    ),GoRoute(
      path: "/WebSocketExample",
      pageBuilder: (context, state)=>MaterialPage(child: WebSocketExample()),
    ),GoRoute(
      path: "/WebsocketDemo",
      pageBuilder: (context, state)=>MaterialPage(child: WebsocketDemo()),
    ),
    GoRoute(
      path: "/LanguageSelectionScreen",
      pageBuilder: (context, state)=>MaterialPage(child: LanguageSelectionScreen()),
    ),GoRoute(
      path: "/GoogleSigninScreen",
      pageBuilder: (context, state)=>MaterialPage(child: GoogleSigninScreen()),
    ),GoRoute(
      path: "/NotificationScreen",
      pageBuilder: (context, state)=>MaterialPage(child: NotificationScreen()),
    ),GoRoute(
      path: "/CategoryScreen",
      pageBuilder: (context, state)=>MaterialPage(child: CategoryScreen()),
    ),
    GoRoute(
      path: "/SignupScreen",
      pageBuilder: (context, state)=>MaterialPage(child: SignUpScreen()),
    ),
    GoRoute(
      path: "/SignInScreen",
      pageBuilder: (context, state)=>MaterialPage(child: SignInScreen()),
    ),
    GoRoute(
      path: "/LightDarkThemeScreen",
      pageBuilder: (context, state)=>MaterialPage(child: LightDarkThemeScreen()),
    ),
    GoRoute(
      path: "/IsolateScreen",
      pageBuilder: (context, state)=>MaterialPage(child: IsolateScreen()),
    ),
  ]
);}
