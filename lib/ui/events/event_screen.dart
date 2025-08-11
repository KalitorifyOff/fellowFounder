import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/events/past_event_screen.dart';
import 'package:ecommerce_app_login/ui/events/upcoming_event_screen.dart';
import 'package:ecommerce_app_login/ui/events/widgets/tab_button.dart';
import 'package:ecommerce_app_login/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool isUpcomingSelected = true;

  void _selectTab(final bool selectUpcoming) {
    if (isUpcomingSelected != selectUpcoming) {
      setState(() => isUpcomingSelected = selectUpcoming);
    }
  }

  Widget _buildTabButtons() => Row(
    children: [
      TabButtonWidget(
        onPress: () => _selectTab(true),
        title: S.upcomingEvents,
        isSelected: isUpcomingSelected,
      ),
      TabButtonWidget(
        onPress: () => _selectTab(false),
        title: S.pastEvents,
        isSelected: !isUpcomingSelected,
      ),
    ],
  );

  @override
  Widget build(final BuildContext context) {
    final Widget bodyContent =
        isUpcomingSelected
            ? const UpcomingEventScreen()
            : const PastEventScreen();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(showBackButton: true, title: S.myEvents),
      body: Column(
        children: [
          _buildTabButtons(),
          Expanded(child: SingleChildScrollView(child: bodyContent)),
        ],
      ),
    );
  }
}
