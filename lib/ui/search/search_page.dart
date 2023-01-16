import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudiko/app_color.dart';
import 'package:fudiko/ui/component/bouncing.dart';
import 'package:go_router/go_router.dart';

part 'search_bottom_view.dart';
part 'search_close_button.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  static const String routeName = 'search_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SafeArea(
            left: false,
            bottom: false,
            right: false,
            child: TextField(
              autofocus: true,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 16, height: 1.5),
              cursorColor: AppColor.textSecondary(context),
              decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                focusColor: Colors.amber,
                fillColor: const Color(0xff1C1C1E),
                filled: true,
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: AppColor.icon(context),
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
          const Expanded(
            child: Text('data'),
          ),
          const Divider(
            height: 8,
            indent: 8,
            endIndent: 8,
          ),
          const _BottomView(),
        ],
      ),
    );
  }
}
