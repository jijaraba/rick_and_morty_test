library core.presentation.theme;

import 'package:flutter/material.dart';
import 'package:rick_and_morty_riverpod/src/core/res/res.dart';
import 'package:rick_and_morty_riverpod/src/core/presentation/widgets/widgets.dart';

part 'shape.dart';

part 'type.dart';

final ThemeData materialTheme = ThemeData(
  primaryColor: UIColors.white,
  colorScheme: ColorScheme.light(
    primary: UIColors.green100,
    onPrimary: UIColors.green100,
    secondary: UIColors.green100,
    onSecondary: UIColors.white,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: UIColors.white,
    selectionHandleColor: UIColors.white,
    selectionColor: UIColors.white,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: SlidePageTransitionBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: UIColors.green100,
    unselectedItemColor: UIColors.textGrey,
    backgroundColor: const Color(0xFFFFFFFF),
  ),
);
