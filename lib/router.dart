import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/ui/main/main_page.dart';
import 'package:fudiko/ui/search/search_page.dart';
import 'package:fudiko/ui/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/${MainPage.routeName}',
        name: MainPage.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const MainPage(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            path: SearchPage.routeName,
            name: SearchPage.routeName,
            pageBuilder: (context, state) =>
                const NoTransitionPage<void>(child: SearchPage()),
            // builder: (context, state) => const SearchPage(),
          )
        ],
      ),
      // GoRoute(
      //   path: '/${SearchPage.routeName}',
      //   name: SearchPage.routeName,
      //   builder: (context, state) => const SearchPage(),
      // )
    ],
  ),
);
