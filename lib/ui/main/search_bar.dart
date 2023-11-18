part of 'main_page.dart';

class _SearchBar extends ConsumerStatefulWidget {
  const _SearchBar();

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<_SearchBar> {
  static final focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {
        ref.read(searchEditingProvider.notifier).state = focusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );

    final editingSearchText = ref.watch(editingSearchTextProvider);

    return Stack(
      children: [
        Blur(
          blur: 4,
          colorOpacity: 0.13,
          borderRadius: border.borderRadius,
          child: const SizedBox(
            width: double.infinity,
            height: 48,
          ),
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
            controller: ref.read(searchBarControllerProvider),
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 16, height: 1.8),
            cursorColor: AppColor.textSecondary(context),
            onChanged: (text) {
              ref.read(editingSearchTextProvider.notifier).state = text;
            },
            onSubmitted: (value) {
              ref
                  .read(mainPageActionProvider.notifier)
                  .onSearchSubmitted(value);
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
                        ref.read(searchBarControllerProvider).clear();
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
        ),
      ],
    );
  }
}
