import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:razio/app_text_style.dart';
import 'package:razio/notification/program_notification_service.dart';
import 'package:razio/provider/shared_preferences_provider.dart';
import 'package:razio/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  debugPaintSizeEnabled = false;
  await initializeDateFormatting('ja_JP');
  await JustAudioBackground.init(
    androidNotificationChannelId: 'dev.famio.razio.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await ProgramNotificationService.init();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      theme: AppThemeData.light(),
      darkTheme: AppThemeData.dark(),
      routerConfig: router,
    );
  }
}
