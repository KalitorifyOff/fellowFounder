import 'package:ecommerce_app_login/constants/resources.dart';
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

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: const AppBarWidget(showBackButton: true, title: S.myEvents),
    body: Column(
      children: [
        //* Switch
        Row(
          children: [
            TabButtonWidget(
              onPress: () {
                setState(() => isUpcomingSelected = !isUpcomingSelected);
              },
              title: S.upcomingEvents,
              isSelected: isUpcomingSelected,
            ),
            TabButtonWidget(
              onPress: () {
                setState(() => isUpcomingSelected = !isUpcomingSelected);
              },
              title: S.pastEvents,
              isSelected: !isUpcomingSelected,
            ),
          ],
        ),

        //* Body
        Expanded(
          child: SingleChildScrollView(
            child:
                isUpcomingSelected
                    ? const Center(child: UpcomingEventScreen())
                    : const Center(
                      child: Text(
                        'Past Events Content',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
          ),
        ),
      ],
    ),
  );
}
