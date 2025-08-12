import 'dart:convert';

import 'package:ecommerce_app_login/ui/events/model/event_model.dart';
import 'package:ecommerce_app_login/ui/events/utils/upcoming_event_mocked_data.dart';
import 'package:ecommerce_app_login/ui/events/widgets/month_view_widget.dart';
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

    return _buildEventList(monthsList);
  }

  //* When events are available
  Widget _buildEventList(final List<MonthEvents> months) => Column(
    children: [
      ...months.map(
        (final month) => MonthViewWidget(
          title: month.month,
          events: month.events,
          isCompleted: false,
        ),
      ),
    ],
  );
}
