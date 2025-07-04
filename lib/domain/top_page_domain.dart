import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectYearState = StateProvider<int?>((ref) => DateTime.now().year);
final selectMonthState = StateProvider<int?>((ref) => DateTime.now().month);
final selectDayState = StateProvider<int?>((ref) => DateTime.now().day);
final selectHourState = StateProvider<int?>((ref) => DateTime.now().hour);
final selectMinuteState = StateProvider<int?>((ref) => DateTime.now().minute);
final isArriveOrDepartureState = StateProvider<int?>((ref) => 0);