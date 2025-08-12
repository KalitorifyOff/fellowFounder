import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/discover_events/model/discovet_event_model.dart';
import 'package:ecommerce_app_login/ui/discover_events/widgets/rounded_button_widget.dart';
import 'package:ecommerce_app_login/ui/events/widgets/icon_lable_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class DiscoverEventBottomSheetComponent extends StatelessWidget {
  const DiscoverEventBottomSheetComponent({required this.event, super.key});
  final Event event;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        //* Img
        Stack(
          children: [
            //* Image
            ClipRRect(
              borderRadius: AppDimensions.borRadius(10),
              child: AppImage(
                imageUrl: event.organizerPic,
                size: AppDimensions.height(50),
                fit: BoxFit.cover,
              ),
            ),

            //* Controls
            Padding(
              padding: Space.all(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* back button
                  RoundedButtonWidget(onTap: () {}),

                  //* share * bookmark
                  Row(
                    spacing: AppDimensions.width(3),
                    children: [
                      //* share
                      RoundedButtonWidget(
                        icon: Icons.share_outlined,
                        onTap: () {},
                      ),

                      //* bookmark
                      RoundedButtonWidget(
                        icon: Icons.bookmark_border_outlined,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        //* Details
        Container(
          margin: Space.all(),
          padding: Space.all(1.3),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 176, 250, 214), AppColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: AppDimensions.borRadius(8),
          ),
          child: Column(
            spacing: AppDimensions.height(1),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.name, style: AppText.b2b),
              Row(
                spacing: AppDimensions.width(10),
                children: [
                  IconLableWidget(iconpath: Assets.calendar, label: event.date),
                  IconLableWidget(iconpath: Assets.clock, label: event.time),
                ],
              ),
              IconLableWidget(iconpath: Assets.mapPin, label: event.address),
              const Divider(),
              Text(S.eventDetails, style: AppText.b3b),
              Text(event.eventDetails),
              Space.y!,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventOrgDetailsComponent(
                    label: S.name,
                    value: event.organizerName,
                  ),
                  EventOrgDetailsComponent(
                    label: S.organizedBy,
                    value: event.organizedBy,
                  ),
                ],
              ),
              const Divider(),
              PrimaryButton(
                text: S.join,
                onPressed: () {},
                color: AppColors.mainPrimary,
                borderRadius: AppDimensions.borRadius(20),
                width: AppDimensions.width(80),
                alignment: Alignment.center,
                textStyle: AppText.b3b!.cl(AppColors.black),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class EventOrgDetailsComponent extends StatelessWidget {
  const EventOrgDetailsComponent({
    required this.label,
    required this.value,
    super.key,
  });
  final String label;
  final String value;

  @override
  Widget build(final BuildContext context) => Text.rich(
    TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: '$label - ',
          style: AppText.b3!.cl(AppColors.grey300).s(14),
        ),
        TextSpan(text: value, style: AppText.b3b!.s(14)),
      ],
    ),
  );
}
