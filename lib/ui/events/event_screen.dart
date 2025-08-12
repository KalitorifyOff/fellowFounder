import 'dart:convert';

import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/events/model/event_model.dart';
import 'package:ecommerce_app_login/ui/events/past_event_screen.dart';
import 'package:ecommerce_app_login/ui/events/utils/upcoming_event_mocked_data.dart';
import 'package:ecommerce_app_login/ui/events/widgets/month_view_widget.dart';
import 'package:ecommerce_app_login/widgets/appbar_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/gradient_button.dart';
import 'package:flutter/material.dart';

part 'components/empty_event_screen.dart';
part 'components/tab_header_item.dart';
part 'components/upcoming_event_counter.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<String> tabs = [S.upcomingEvents, S.pastEvents];
  String tabSelected = S.upcomingEvents;

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: const AppBarWidget(showBackButton: true, title: S.myEvents),
    body: Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < tabs.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    tabSelected = tabs[i];
                  });
                },
                child: _TabHeaderItem(
                  title: tabs[i],
                  isSelected: tabSelected == tabs[i],
                ),
              ),
          ],
        ),

        Expanded(
          child: SingleChildScrollView(
            child:
                tabSelected == tabs.first
                    ? const _UpcomingEventsTab()
                    : const PastEventScreen(),
          ),
        ),
      ],
    ),
  );
}

class _UpcomingEventsTab extends StatelessWidget {
  const _UpcomingEventsTab();
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
