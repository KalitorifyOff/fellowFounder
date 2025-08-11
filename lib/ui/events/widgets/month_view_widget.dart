import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/ui/events/components/month_title_view_component.dart';
import 'package:ecommerce_app_login/ui/events/model/event_model.dart';
import 'package:ecommerce_app_login/ui/events/widgets/event_item_widget.dart';
import 'package:flutter/material.dart';

class MonthViewWidget extends StatelessWidget {
  const MonthViewWidget({required this.title, required this.events, super.key});
  final String title;
  final List<EventModel> events;

  @override
  Widget build(final BuildContext context) => Padding(
    padding: Space.h!,
    child: Column(
      children: [
        //* Month list view
        MothTitleViewComponent(title: title),

        //* Event Items
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: events.length,
          itemBuilder:
              (final context, final index) => EventItemWidget(
                imgPath: events[index].eventImgUrl,
                eventName: events[index].eventName,
                date: events[index].date,
                time: events[index].time,
                organizerName: events[index].organizerName,
                isSave: events[index].isSaved,
                location: events[index].location,
                labelValue: events[index].daysToGo,
              ),
        ),
      ],
    ),
  );
}
