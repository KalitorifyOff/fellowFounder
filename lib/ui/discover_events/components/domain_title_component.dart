import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/discover_events/model/discovet_event_model.dart';
import 'package:flutter/material.dart';

class DomainTitleComponent extends StatelessWidget {
  const DomainTitleComponent({required this.domainEvent, super.key});

  final Domain domainEvent;

  @override
  Widget build(final BuildContext context) => Padding(
    padding: Space.h1!,
    child: Row(
      spacing: AppDimensions.width(5),
      children: [
        Text(
          domainEvent.domainName,
          style: AppText.b3!.cl(AppColors.grey300),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Expanded(child: Divider()),
      ],
    ),
  );
}
