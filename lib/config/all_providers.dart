import 'package:provider/provider.dart';
import '../utils/helper/languageSelection/Provider/languageSelection_provider.dart';
import '../utils/helper/theme/theme_provider.dart';
import '../utils/local_provider.dart';
import '../views/dating_list_screen/dating_provider/dating_provider.dart';

class AppAllProviders{

  static get appAllProviders => [

    ChangeNotifierProvider(create: (context) => LanguageChangeController()),
    ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
    ChangeNotifierProvider(create: (context) => LocalProvider()),
    ChangeNotifierProvider(create: (context) => DatingProvider()),


  ];
}
