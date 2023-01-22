import 'package:flutter/material.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/provider/safearea_provider.dart';
import 'package:fudiko/ui/main/main_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ref.watch(authProvider).when(
              data: (data) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(nativeSafeAreaProvider.notifier).state =
                      MediaQuery.of(context).padding;
                  context.replaceNamed(MainPage.routeName);
                });
                return const Text('');
              },
              loading: () => const Text(''),
              error: (error, stack) => const Text('error :('),
            ),
      ),
    );
  }
}
