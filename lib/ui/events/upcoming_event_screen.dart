import 'dart:convert';

import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/events/components/notification_component.dart';
import 'package:ecommerce_app_login/ui/events/model/event_model.dart';
import 'package:ecommerce_app_login/ui/events/utils/mocked_data.dart';
import 'package:ecommerce_app_login/ui/events/widgets/month_view_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/gradient_button.dart';
import 'package:flutter/material.dart';

class UpcomingEventScreen extends StatelessWidget {
  const UpcomingEventScreen({super.key});

  List<MonthEvents> _parseMonthsList() {
    final jsonData = jsonDecode(eventsJson) as List;
    return jsonData
        .map((final e) => MonthEvents.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(final BuildContext context) {
    final monthsList = _parseMonthsList();

    if (monthsList.isNotEmpty) {
      return _buildEventList(monthsList);
    } else {
      return _buildEmptyState();
    }
  }

  //* When events are available
  Widget _buildEventList(final List<MonthEvents> months) => Column(
    children: [
      NotificationComponent(
        eventCount: months.first.events.length,
        month: months.first.month,
      ),
      ...months.map(
        (final month) =>
            MonthViewWidget(title: month.month, events: month.events),
      ),
    ],
  );

  //* When no events are found
  Widget _buildEmptyState() => Column(
    //todo: how to align in center
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AppImage(
        imageUrl: Assets.emptyUpcomingEvents,
        size: AppDimensions.font(100),
      ),
      // const SizedBox(height: 16),
      Text(S.nothingOnYourCalendar, style: AppText.b1b),
      // const SizedBox(height: 8),
      Text(
        S.planYourFirstEvent,
        style: AppText.b2!.cl(AppColors.grey500),
        textAlign: TextAlign.center,
      ),
      // const SizedBox(height: 24),
      GradientButton(
        onPressed: () {},
        text: S.createEvents,
        icon: Assets.calendarPlus1,
        margin: Space.hf(5),
      ),
    ],
  );
}
