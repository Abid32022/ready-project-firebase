import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/dating_list_screen/dating_list_screen.dart';


class AppRoute{
  static final GoRouter router = GoRouter(routes:  [
    GoRoute(
      path: "/",
            pageBuilder: (context, state)=>MaterialPage(child: DatingListScreen()),
    ),
  ]
);
}
