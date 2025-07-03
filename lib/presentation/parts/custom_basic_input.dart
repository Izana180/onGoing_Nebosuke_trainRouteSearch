import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nebosuke_trainroutesearch/presentation/style/custom_colors.dart';

// テキストボックス
class CustomBasicInput extends HookConsumerWidget {
  CustomBasicInput({
    Key? key,
    this.hintText,
    this.labelText,
    this.maxLine,
    this.onChanged,
    this.focusNode,
    this.textEditingController,
    this.isPassword = false,
    this.isUseThinBlack = false,
    this.showTextCounter = false,
    this.subText,
    this.subTextColor,
    this.errText,
    this.isDeparture = false,
    this.isArrival = false,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;
  final int? maxLine;
  final Function(String)? onChanged;
  final bool isPassword;
  final TextEditingController? textEditingController;
  final bool isUseThinBlack;
  final bool showTextCounter;
  final String? subText;
  final Color? subTextColor;
  final String? errText;
  final bool isDeparture;
  final bool isArrival;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textCounter = useState(textEditingController?.text.length ?? 0);
    final outlineInputBorder = errText == null
        // エラーでない
        ? const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        )
        //  エラー時
        : const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.strongRed),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        );
    return Column(
      children: [
        // いずれかが存在するときのみ表示箇所のRowを生成
        if(errText!=null || subText != null || labelText != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(labelText != null)
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    labelText ?? '',
                    style: const TextStyle(
                      color: CustomColors.baseWhite,
                      fontSize: 13,
                    ),
                  ),
                ),
              Builder(builder: (context) {
                if(errText != null) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      errText!,
                      style: const TextStyle(color: CustomColors.strongRed, fontSize: 10),
                    ),
                  );
                } else if (subText != null) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      subText!,
                      style: TextStyle(color: subTextColor ?? CustomColors.baseWhite, fontSize: 10),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        TextField(
          maxLines: maxLine ?? 1,
          focusNode: focusNode,
          controller: textEditingController,
          obscureText: isPassword,
          // 出発、到着アイコンのスタイル指定
          decoration: InputDecoration(
            prefixIcon: isDeparture || isArrival
              ? Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                decoration: BoxDecoration(
                  color: isDeparture
                  ? CustomColors.departureButtonColor
                  : CustomColors.arrivalButtonColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    isDeparture ? '出発' : '到着',
                    style: const TextStyle(
                      color: CustomColors.baseWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : null,
            fillColor: isUseThinBlack ? CustomColors.minBlack : CustomColors.inputBlack,
            filled: true,
            hintText: hintText ?? '入力してください',
            hintStyle: const TextStyle(
              color: CustomColors.baseGray3,
              fontSize: 14,
            ),
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
          ),
          style: const TextStyle(
            color: CustomColors.baseWhite,
            fontSize: 14,
          ),
          onChanged: (value) {
            if(onChanged != null) {
              onChanged!(value);
            }
            textCounter.value = value.length;
          },
        ),
        if(showTextCounter)
          HookBuilder(builder: (context) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '${textCounter.value}文字',
                style: const TextStyle(
                  color: CustomColors.baseWhite,
                  fontSize: 12,
                ),
              ),
            );
          }),
      ],
    );
  }
}