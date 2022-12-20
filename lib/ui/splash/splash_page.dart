import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/provider/auth_provider.dart';
import 'package:fudiko/ui/main/main_page.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ref.watch(authProvider).when(
              data: (data) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.replaceNamed(MainPage.routeName);
                });
                return const Text('Ready');
              },
              loading: () => const Text('Loading...'),
              error: (error, stack) => const Text('error :('),
            ),
      ),
    );
  }
}
