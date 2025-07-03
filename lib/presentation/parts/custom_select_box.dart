import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nebosuke_trainroutesearch/presentation/style/custom_colors.dart';


// 任意型のリストボックス(プルダウン)
class CustomSelectBox<T> extends HookConsumerWidget {
  const CustomSelectBox({
    super.key,
    required this.value,
    required this.items,
    this.hintText,
    this.labelText,
    this.defaultValue,
  });

  final StateProvider<T?> value;
  final List<CustomSelectItem> items;
  final String? hintText;
  final String? labelText;
  final T? defaultValue;

  // 外枠
  final outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = ref.watch(value);

    if(selectedValue == null && defaultValue != null){
      ref.read(value.notifier).state = defaultValue;
    }

    return Column(
      children: [
        // ラベル
        if(labelText != null)
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              labelText ?? '',
              style: const TextStyle(
                color: CustomColors.baseWhite,
                fontSize: 13,
              ),
            ),
          ),
        // ボックス自体の定義
        DropdownButtonFormField<T?>(
          // 現在選択されている値を取得
          value: ref.watch(value),
          // 選択不可時
          disabledHint: const Text(
            '選択できません',
            style: TextStyle(
              color: CustomColors.baseGray3,
              fontSize: 14,
            ),
          ),
          // 無選択時
          hint: Text(
            hintText ?? '選択してください',
            style: const TextStyle(
              color: CustomColors.baseGray3,
              fontSize: 14,
            ),
          ),
          // スタイル
          decoration: InputDecoration(
            fillColor: CustomColors.inputBlack,
            filled: true,
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
          ),
          dropdownColor: CustomColors.inputBlack,
          isExpanded: true,
          // 内部処理用のリストをフロント用の選択肢に変換
          items:
              items.map(
                (item) => DropdownMenuItem<T>(
                  value: item.value,
                  child: Text(item.label, style: TextStyle(color: CustomColors.baseWhite),
                  // 選択肢の文字列が長い場合に省略
                  overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(),
          onChanged: (value) {
            ref.read(this.value.notifier).update((state) => value);
          },
        ),
      ],
    );
  }
}

// 内部処理用の構造体
class CustomSelectItem<T> {
  const CustomSelectItem({
    required this.value,
    required this.label,
  });

  final T? value;
  final String label;
}
