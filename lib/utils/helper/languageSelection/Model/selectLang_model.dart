import 'package:flutter/material.dart';


class SelectLanguageModel {
  final String title;
  final Widget leadingIcon;
  final String trailingText;
  final String localeCode;

  SelectLanguageModel({
    required this.title,
    required this.leadingIcon,
    required this.trailingText,
    required this.localeCode,
  });
}

