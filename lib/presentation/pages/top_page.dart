import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nebosuke_trainroutesearch/presentation/parts/input/custom_basic_input.dart';

class TopPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final departureController = useTextEditingController();
    final arrivalController = useTextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/img/nebosukeLogo.png',
              width: screenWidth * 0.75,
            ),
            SizedBox(height:24),
            CustomBasicInput(
              isDeparture: true,
              hintText: '出発駅を入力',
              textEditingController: departureController
            ),
            SizedBox(height: 12),
            CustomBasicInput(
              isArrival: true,
              hintText: '到着駅を入力',
              textEditingController: arrivalController
            ),
          ],
        ),
      ),
    );
  }
}