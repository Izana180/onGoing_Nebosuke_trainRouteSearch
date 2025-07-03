import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nebosuke_trainroutesearch/domain/top_page_domain.dart';
import 'package:nebosuke_trainroutesearch/presentation/parts/custom_basic_input.dart';
import 'package:nebosuke_trainroutesearch/presentation/parts/custom_select_box.dart';
import 'package:nebosuke_trainroutesearch/presentation/parts/custom_button.dart';
import 'package:nebosuke_trainroutesearch/presentation/pages/route_select_page.dart';

class TopPage extends HookConsumerWidget {
  // 年月日の選択肢を生成
  List<CustomSelectItem<int>> selectYear = List.generate(
    2025 - 2020 + 1,  // 要素数
    (index) {
      int year = 2020 + index;
      return CustomSelectItem<int>(value: year, label: '$year年');
    },
  );
  List<CustomSelectItem<int>> selectMonth = List.generate(
    12,
    (index) {
      int month = index+1;
      return CustomSelectItem<int>(value: month, label: '$month月');
    },
  );
  List<CustomSelectItem<int>> selectDay = List.generate(
    31,
    (index) {
      int day = index+1;
      return CustomSelectItem<int>(value: day, label: '$day日');
    },
  );
  List<CustomSelectItem<int>> selectHour = List.generate(
    24,
    (index) {
      int hour = index;
      return CustomSelectItem<int>(value: hour, label: '$hour時');
    },
  );
  List<CustomSelectItem<int>> selectMinute = List.generate(
    60,
    (index) {
      int minute = index;
      return CustomSelectItem<int>(value: minute, label: '$minute分');
    },
  );
  List<CustomSelectItem<String>> isArriveOrDeparture = [
    const CustomSelectItem<String>(value: '出発', label: '出発'),
    const CustomSelectItem<String>(value: '到着', label: '到着'),
  ];

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
            const SizedBox(height:24),
            Image.asset(
              'assets/img/nebosukeLogo.png',
              width: screenWidth * 0.75,
            ),
            const SizedBox(height:24),
            CustomBasicInput(
              isDeparture: true,
              hintText: '出発駅を入力',
              textEditingController: departureController
            ),
            const SizedBox(height: 12),
            CustomBasicInput(
              isArrival: true,
              hintText: '到着駅を入力',
              textEditingController: arrivalController
            ),
            const SizedBox(height: 12),
            // 年月日の入力枠を横並びに表示
            // TODO:今日の日付をデフォルト表示するか、現在時刻に設定するボタンを追加
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.3,
                  child: CustomSelectBox<int>(
                    value: selectYearState,
                    hintText: '年',
                    items: selectYear,
                    onChanged: (v) => ref.read(selectYearState.notifier).state = v,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: screenWidth * 0.22,
                  child: CustomSelectBox<int>(
                    value: selectMonthState,
                    hintText: '月',
                    items: selectMonth,
                    onChanged: (v) => ref.read(selectMonthState.notifier).state = v,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: screenWidth * 0.22,
                  child: CustomSelectBox<int>(
                    value: selectDayState,
                    hintText: '日',
                    items: selectDay,
                    onChanged: (v) => ref.read(selectDayState.notifier).state = v,
                  ),
                )
            ],),
            const SizedBox(height: 12),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.22,
                  child: CustomSelectBox<int>(
                    value: selectHourState,
                    hintText: '時',
                    items: selectHour,
                    onChanged: (v) => ref.read(selectHourState.notifier).state = v,
                  )
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: screenWidth * 0.22,
                  child: CustomSelectBox<int>(
                    value: selectMinuteState,
                    hintText: '分',
                    items: selectMinute,
                    onChanged: (v) => ref.read(selectMinuteState.notifier).state = v,
                  )
                ),
                const SizedBox(width: 10),
                // 出発、到着 初期値は出発
                SizedBox(
                  width: screenWidth * 0.22,
                  child: CustomSelectBox<String>(
                    value: isArriveOrDepartureState,
                    items: isArriveOrDeparture,
                    onChanged: (v) => ref.read(isArriveOrDepartureState.notifier).state = v,
                  )
                ),
              ],
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: 'ルート検索',
              // calli置き
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RouteSelectPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}