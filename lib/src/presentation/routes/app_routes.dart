import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/screens/character_detail_page.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/screens/home_page.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/screens/onboarding_page.dart';
import 'package:rick_and_morty_riverpod/src/presentation/view/screens/splash_page.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      name: 'splash',
      path: '/',
      pageBuilder: (_, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      pageBuilder: (_, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const OnboardingPage(),
      ),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      pageBuilder: (_, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      name: 'character_detail',
      path: '/home/character/:cid',
      pageBuilder: (_, state) {
        final characterId = state.params['cid'];

        if (characterId == null) throw Exception('Character no found');

        return MaterialPage<void>(
          child: CharacterDetailPage(
            characterId: characterId,
          ),
        );
      },
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            state.error?.toString() ?? 'Page no found',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  ),
);
