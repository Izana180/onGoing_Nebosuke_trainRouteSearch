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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textCounter = useState(textEditingController?.text.length ?? 0);
    final OutlineInputBorder = errText == null
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
  }
}