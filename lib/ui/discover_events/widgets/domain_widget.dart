import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/ui/discover_events/components/domain_title_component.dart';
import 'package:ecommerce_app_login/ui/discover_events/components/event_component.dart';
import 'package:ecommerce_app_login/ui/discover_events/model/discovet_event_model.dart';
import 'package:flutter/material.dart';

class DomainWidget extends StatelessWidget {
  const DomainWidget({required this.domainEvent, super.key});
  final Domain domainEvent;

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      //* Title
      DomainTitleComponent(domainEvent: domainEvent),

      //* Events
      SizedBox(
        height: AppDimensions.height(15),
        child: ListView.builder(
          itemCount: domainEvent.events.length,
          shrinkWrap: true,
          primary: false,
          padding: Space.h1,
          scrollDirection: Axis.horizontal,
          itemBuilder:
              (final context, final index) =>
                  EventComponent(event: domainEvent.events[index]),
        ),
      ),
    ],
  );
}
