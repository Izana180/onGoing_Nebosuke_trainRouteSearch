import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nebosuke_trainroutesearch/presentation/style/custom_colors.dart';

class CustomButton extends HookConsumerWidget {
  CustomButton({
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.disable = false,
    Key? key,
  }) : super(key: key);
  final String text;
  final double width;
  final bool disable;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callBack = disable ? null : onPressed;

    Color? backgroundColor() {
      if(disable) return CustomColors.disableBackground;
      return null;
    }

    final backGroundColor = backgroundColor();
    const textColor = CustomColors.textColor;
    const gradient = CustomColors.baseGradient;


    return Material(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: callBack,

          highlightColor: Colors.black.withOpacity(0.2),
          splashColor: Colors.transparent,
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 11.5, horizontal: 15),
            child: Center(
              child: Builder(builder: (context) {
                return Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )
                );
              },)
            )
          )
        ),
      ),
    );
  }
}