import 'dart:convert';

import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/discover_events/model/discovet_event_model.dart';
import 'package:ecommerce_app_login/ui/discover_events/utils/discover_event_mocked_data.dart';
import 'package:ecommerce_app_login/ui/discover_events/widgets/domain_widget.dart';
import 'package:ecommerce_app_login/widgets/appbar_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class DiscoverEventsScreen extends StatelessWidget {
  const DiscoverEventsScreen({super.key});

  List<Domain> get _domainEventsList =>
      (jsonDecode(discoverEventMockedJson) as List)
          .map((final e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList();

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: const AppBarWidget(showBackButton: true, title: S.events),
    body:
        _domainEventsList.isNotEmpty
            ? _buildDomainEventsList()
            : _buildEmptyState(),
  );

  Widget _buildDomainEventsList() => ListView.builder(
    itemCount: _domainEventsList.length,
    itemBuilder:
        (final context, final index) =>
            DomainWidget(domainEvent: _domainEventsList[index]),
  );

  Widget _buildEmptyState() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImage(
          imageUrl: Assets.emptyUpcomingEvents,
          size: AppDimensions.font(100),
        ),
        Text(S.noPastEvents, style: AppText.b1b),
        Text(
          S.pastEentEmptyMessage,
          style: AppText.b2!.cl(AppColors.grey500),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
