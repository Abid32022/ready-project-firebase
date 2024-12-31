import 'package:my_qurbani/views/auth/sign_up/sign_up_provider/sign_up_provider.dart';
import 'package:provider/provider.dart';

import '../utils/local_provider.dart';
import '../views/dashboard/category_provider.dart';
import '../views/languageSelection/Provider/languageSelection_provider.dart';
import '../views/test/login_provider/login_provider.dart';
import '../views/theme/theme_provider.dart';

class AppAllProviders{

  static get appAllProviders => [
    ChangeNotifierProvider(create: (context) => SignUpProvider()),
    ChangeNotifierProvider(create: (context) => LanguageChangeController()),
    ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
    ChangeNotifierProvider(create: (context) => LocalProvider()),
    ChangeNotifierProvider(create: (context) => LoginProvider()),

  ];
}
