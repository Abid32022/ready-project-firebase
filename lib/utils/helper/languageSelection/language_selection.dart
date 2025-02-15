import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'Provider/languageSelection_provider.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

enum Language { english, spanish }

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
                return PopupMenuButton(
                    onSelected: (Language item) {
                      if (Language.english.name == item.name) {
                        provider.changeLanguage(Locale('en'));
                      } else {
                        provider.changeLanguage(Locale('es'));
                      }
                    },
                    itemBuilder: (context) => <PopupMenuEntry<Language>>[
                      const PopupMenuItem(
                          value: Language.english, child: Text('English')),
                      const PopupMenuItem(
                          value: Language.spanish, child: Text('Spanish')),
                    ]);
              }),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(AppLocalizations.of(context)!.name),
          ),
          ElevatedButton(
          onPressed: () {
            context.push('/CategoryScreen');
    // final languageController = context.read<LanguageChangeController>();
    // languageController.updateLanguage();
    },
    child: Text('Save'),
    )

    // MaterialButton(onPressed: (){
          //   changeLanguage
          // })
        ],
      ),
    );
  }
}