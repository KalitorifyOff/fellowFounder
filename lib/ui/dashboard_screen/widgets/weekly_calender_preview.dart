import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/dashboard_screen/widgets/dashboard_core_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekCalendarPreview extends StatelessWidget {
  const WeekCalendarPreview({required this.selectedDay, super.key});
  final ValueNotifier<DateTime> selectedDay;

  @override
  Widget build(final BuildContext context) => Expanded(
    child: ValueListenableBuilder<DateTime>(
      valueListenable: selectedDay,
      builder:
          (final context, final day, _) => TableCalendar(
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2100),
            focusedDay: day,
            selectedDayPredicate:
                (final date) => isSameDay(date, selectedDay.value),
            calendarFormat: CalendarFormat.week,
            availableCalendarFormats: const {CalendarFormat.week: 'Week'},
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: false,
            onDaySelected: (final selected, final focused) {
              selectedDay.value = selected;
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColors.indicatorColor1,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: AppColors.mainPrimary,
                shape: BoxShape.circle,
              ),
            ),
          ),
    ),
  );
}

class MonthCalendarPreview extends StatelessWidget {
  const MonthCalendarPreview({required this.selectedDay, super.key});
  final ValueNotifier<DateTime> selectedDay;

  @override
  Widget build(final BuildContext context) => Expanded(
    child: ValueListenableBuilder<DateTime>(
      valueListenable: selectedDay,
      builder:
          (final context, final day, _) => TableCalendar(
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2100),
            focusedDay: day,
            selectedDayPredicate:
                (final date) => isSameDay(date, selectedDay.value),
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: AppText.b2b!,
            ),
            onDaySelected: (final selected, final focused) {
              selectedDay.value = selected;
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColors.indicatorColor1,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: AppColors.mainPrimary,
                shape: BoxShape.circle,
              ),
            ),
          ),
    ),
  );
}

class CustomRangeView extends StatelessWidget {
  const CustomRangeView({
    required this.fromDate,
    required this.toDate,
    super.key,
  });
  final ValueNotifier<DateTime> fromDate;
  final ValueNotifier<DateTime> toDate;

  @override
  Widget build(final BuildContext context) => Row(
    children: [
      DateField(
        context: context,
        dateNotifier: fromDate,
        minDate: DateTime(2000),
        maxDate: DateTime.now(),
      ),
      SizedBox(width: AppDimensions.width(2)),
      const Text(S.to),
      SizedBox(width: AppDimensions.width(2)),
      ValueListenableBuilder<DateTime>(
        valueListenable: fromDate,
        builder:
            (_, final from, final __) => DateField(
              context: context,
              dateNotifier: toDate,
              minDate: from,
              maxDate: DateTime.now(),
            ),
      ),
    ],
  );
}

class DateField extends StatelessWidget {
  const DateField({
    required this.context,
    required this.dateNotifier,
    required this.minDate,
    required this.maxDate,
    super.key,
  });
  final BuildContext context;
  final ValueNotifier<DateTime> dateNotifier;
  final DateTime minDate;
  final DateTime maxDate;

  @override
  Widget build(final BuildContext context) => ValueListenableBuilder<DateTime>(
    valueListenable: dateNotifier,
    builder:
        (_, final date, final __) => InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: this.context,
              initialDate: date,
              firstDate: minDate,
              lastDate: maxDate,
            );
            if (picked != null) {
              dateNotifier.value = picked;
            }
          },
          child: DateWidget(date: DateFormat('dd-MMMM-yyyy').format(date)),
        ),
  );
}
