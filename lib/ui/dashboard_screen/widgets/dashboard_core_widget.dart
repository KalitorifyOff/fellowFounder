import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_styles.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerce_app_login/ui/dashboard_screen/widgets/weekly_calender_preview.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({required this.selectedFilter, super.key});

  final ValueNotifier<FilterType> selectedFilter;

  String getFilterLabel(final FilterType type) {
    switch (type) {
      case FilterType.today:
        return S.today;
      case FilterType.oneWeek:
        return S.oneWeek;
      case FilterType.oneMonth:
        return S.oneMonth;
      case FilterType.custom:
        return S.custom;
    }
  }

  @override
  Widget build(final BuildContext context) =>
      ValueListenableBuilder<FilterType>(
        valueListenable: selectedFilter,
        builder:
            (final context, final value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  FilterType.values.map((final filter) {
                    final isSelected = value == filter;
                    return PrimaryButton(
                      onPressed: () => selectedFilter.value = filter,
                      text: getFilterLabel(filter),
                      textStyle: AppText.b2b!.cl(Colors.black).tsc(0.7),
                      color:
                          isSelected
                              ? AppColors.mainPrimary
                              : Colors.transparent,
                      padding: Space.all(0.2),
                      height: 25,
                      width: 72,
                      alignment: Alignment.center,
                      border: Border.all(color: const Color(0xFFCFDCDC)),
                      borderRadius: AppDimensions.borRadius(2),
                    );
                  }).toList(),
            ),
      );
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(final BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: Space.v1!,
      child: Text(title, style: AppText.b2!.w(5).cl(AppColors.grey500)),
    ),
  );
}

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({
    required this.title,
    required this.count,
    super.key,
    this.imgPath,
  });

  final String title;
  final int count;
  final String? imgPath;

  @override
  Widget build(final BuildContext context) => Container(
    padding: Space.v1,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: AppDimensions.borRadius(5),
      border: Border.all(color: AppColors.borderColors),
      boxShadow: AppStyles.boxShadow,
    ),
    child: IntrinsicHeight(
      child: Row(
        children: [
          Space.xf(0.6),
          if (imgPath != null)
            Container(
              height: AppDimensions.normalize(10),
              width: AppDimensions.normalize(10),
              padding: Space.v1!.t(0.3).b(0.3).l(0),
              decoration: const BoxDecoration(
                color: AppColors.mainPrimary,
                shape: BoxShape.circle,
              ),
              child: AppImage(imageUrl: imgPath!, height: 40, width: 40),
            ),
          Space.xf(0.6),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title, style: AppText.b2!.w(5))],
            ),
          ),
          const VerticalDivider(color: AppColors.borderColors),
          Padding(
            padding: Space.h1!,
            child: Text('$count', style: AppText.b3!.w(4)),
          ),
        ],
      ),
    ),
  );
}

class BarRodIndicator extends StatelessWidget {
  const BarRodIndicator({required this.color, required this.label, super.key});

  final Color color;
  final String label;

  @override
  Widget build(final BuildContext context) => Row(
    spacing: AppDimensions.width(2),
    children: [
      Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(final BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      gradient: AppStyles.linearGradient,
      borderRadius: AppDimensions.borRadius(5),
      boxShadow: AppStyles.boxShadow,
    ),
    child: Padding(
      padding: Space.vf(1.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    ),
  );
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({required this.title, required this.value, super.key});

  final String title;
  final String value;

  @override
  Widget build(final BuildContext context) => Column(
    spacing: AppDimensions.height(1),
    children: [
      Text(title, style: AppText.b1!.w(5).cl(AppColors.white).tsc(0.6)),
      Text(value, style: AppText.b1!.w(6).cl(AppColors.mainPrimary).tsc(0.7)),
    ],
  );
}

class DateWidget extends StatelessWidget {
  const DateWidget({required this.date, super.key});
  final String date;

  @override
  Widget build(final BuildContext context) => IntrinsicWidth(
    child: Container(
      padding: Space.all(0.7, 0.3),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey500),
        borderRadius: AppDimensions.borRadius(2),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 16, color: AppColors.grey300),
          SizedBox(width: AppDimensions.width(2)),
          Text(date),
        ],
      ),
    ),
  );
}

class DateFilterView extends StatelessWidget {
  const DateFilterView({
    required this.selectedFilter,
    required this.selectedDay,
    required this.fromDate,
    required this.toDate,
    super.key,
  });
  final ValueNotifier<FilterType> selectedFilter;
  final ValueNotifier<DateTime> selectedDay;
  final ValueNotifier<DateTime> fromDate;
  final ValueNotifier<DateTime> toDate;

  @override
  Widget build(final BuildContext context) =>
      ValueListenableBuilder<FilterType>(
        valueListenable: selectedFilter,
        builder: (final context, final filterType, _) {
          switch (filterType) {
            case FilterType.today:
              final today = DateFormat('dd-MMMM-yyyy').format(DateTime.now());
              return DateWidget(date: today);

            case FilterType.oneWeek:
              return WeekCalendarPreview(selectedDay: selectedDay);

            case FilterType.oneMonth:
              return MonthCalendarPreview(selectedDay: selectedDay);

            case FilterType.custom:
              return CustomRangeView(fromDate: fromDate, toDate: toDate);
          }
        },
      );
}
