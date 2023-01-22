part of 'main_page.dart';

class _SearchBar extends ConsumerWidget {
  static final controller = TextEditingController();
  static final focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(8),
    );

    final editingSearchText = ref.watch(editingSearchTextProvider);

    return Stack(
      children: [
        Container(
          height: 48,
        ).frosted(
          blur: 4,
          frostOpacity: 0.4,
          frostColor: AppColor.frost(context),
          borderRadius: border.borderRadius,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  brightness:
                      isLightMode(context) ? Brightness.light : Brightness.dark,
                  primary: AppColor.icon(context),
                ),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 16, height: 1.8),
            cursorColor: AppColor.textSecondary(context),
            onChanged: (text) {
              ref.read(editingSearchTextProvider.notifier).state = text;
            },
            decoration: InputDecoration(
              enabledBorder: border,
              focusedBorder: border,
              fillColor: Colors.transparent,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                size: 22,
              ),
              prefixIconColor: AppColor.icon(context),
              suffixIcon: editingSearchText.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        controller.clear();
                        ref.read(editingSearchTextProvider.notifier).state = '';
                        focusNode.requestFocus();
                      },
                      icon: const Icon(
                        Icons.clear_rounded,
                        size: 22,
                      ),
                    ),
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
          ),
        )
      ],
    );
  }
}
