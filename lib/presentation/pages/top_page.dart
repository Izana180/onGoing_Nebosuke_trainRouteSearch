import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nebosuke_trainroutesearch/domain/top_page_domain.dart';
import 'package:nebosuke_trainroutesearch/presentation/parts/input/custom_basic_input.dart';
import 'package:nebosuke_trainroutesearch/presentation/parts/input/custom_select_box.dart';

class TopPage extends HookConsumerWidget {
  // 年月日の選択肢を生成
  List<CustomSelectItem> selectYear = List.generate(
    2025 - 2020 + 1,  // 要素数
    (index) {
      int year = 2020 + index;
      return CustomSelectItem<int>(value: year, label: '$year年');
    },
  );
  List<CustomSelectItem> selectMonth = List.generate(
    12,
    (index) {
      int month = index+1;
      return CustomSelectItem<int>(value: month, label: '$month月');
    },
  );
  List<CustomSelectItem> selectDay = List.generate(
    31,
    (index) {
      int day = index+1;
      return CustomSelectItem<int>(value: day, label: '$day日');
    },
  );

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
            SizedBox(height: 12),
            // 年月日を横並びに表示
            // TODO:今日の日付をデフォルト表示するか、現在時刻に設定するボタンを追加
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.3,
                  child: CustomSelectBox<int>(
                    value: selectYearState,
                    hintText: '年',
                    items: selectYear,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: screenWidth * 0.2,
                  child: CustomSelectBox<int>(
                    value: selectMonthState,
                    hintText: '月',
                    items: selectMonth,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: screenWidth * 0.2,
                  child: CustomSelectBox<int>(
                    value: selectDayState,
                    hintText: '日',
                    items: selectDay,
                  ),
                )
            ],)
          ],
        ),
      ),
    );
  }
}