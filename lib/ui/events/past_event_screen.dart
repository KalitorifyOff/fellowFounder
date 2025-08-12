import 'dart:convert';

import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/events/model/event_model.dart';
import 'package:ecommerce_app_login/ui/events/utils/past_event_mocked_data.dart';
import 'package:ecommerce_app_login/ui/events/widgets/month_view_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class PastEventScreen extends StatelessWidget {
  const PastEventScreen({super.key});

  List<MonthEvents> _parseMonthsList() {
    final jsonData = jsonDecode(pastEventsJson) as List;
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
  Widget _buildEventList(final List<MonthEvents> months) => Padding(
    padding: Space.h!.t(2),
    child: Column(
      children: [
        ...months.map(
          (final month) => MonthViewWidget(
            title: month.month,
            events: month.events,
            isCompleted: true,
          ),
        ),
      ],
    ),
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
      Text(S.noPastEvents, style: AppText.h1b),
      Text(
        S.pastEentEmptyMessage,
        style: AppText.b2!.cl(AppColors.grey500),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
