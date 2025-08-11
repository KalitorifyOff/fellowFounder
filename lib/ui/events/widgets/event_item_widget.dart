import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/events/components/gray_scale_component.dart';
import 'package:ecommerce_app_login/ui/events/components/rounded_rect_label_component.dart';
import 'package:ecommerce_app_login/ui/events/components/save_button_component.dart';
import 'package:ecommerce_app_login/ui/events/widgets/icon_lable_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({
    required this.imgPath,
    required this.eventName,
    required this.location,
    required this.date,
    required this.time,
    required this.organizerName,
    super.key,
    this.labelValue,
    this.isCompleted = false,
    this.isSave,
  });
  final String imgPath;
  final String eventName;
  final int? labelValue;
  final String location;
  final String date;
  final String time;
  final String organizerName;
  final bool? isSave;
  final bool isCompleted;

  @override
  Widget build(final BuildContext context) => Grayscale(
    isActive: isCompleted,
    child: Container(
      margin: Space.all(),
      padding: Space.all(0.6),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xFFC2C6C6)),
        borderRadius: AppDimensions.borRadius(3),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(99, 138, 146, 151),
            blurRadius: 3,
            offset: Offset(3.33, 3.33),
          ),
        ],
      ),
      child: Column(
        children: [
          //* Top session
          Row(
            spacing: AppDimensions.width(2),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Event Image
              ClipRRect(
                borderRadius: AppDimensions.borRadius(2),
                child: AppImage(
                  imageUrl: imgPath,
                  size: AppDimensions.font(40),
                ),
              ),

              //* Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppDimensions.height(1),
                  children: [
                    //* Event name and label
                    Row(
                      children: [
                        //* Event name
                        Expanded(
                          child: Text(
                            eventName,
                            style: AppText.b2b,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        //* label
                        // todo: whats the logic for changing the bg color
                        if (labelValue != null)
                          RoundedRectLabelComponent(
                            labelValue: '$labelValue days to go',
                          ),
                        if (isCompleted)
                          const RoundedRectLabelComponent(
                            labelValue: 'Completed',
                          ),
                      ],
                    ),

                    //* Location
                    IconLableWidget(iconpath: Assets.mapPin, label: location),

                    //* Date & Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //* Date
                        IconLableWidget(label: date, iconpath: Assets.calendar),
                        //* Time
                        IconLableWidget(label: time, iconpath: Assets.clock),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          //* Divider
          Padding(padding: Space.vf(0.3), child: const Divider()),

          //* Bottom Session
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* Organizer Details
              RichText(
                text: TextSpan(
                  text: 'Organized by ',
                  style: AppText.b3!.cl(AppColors.black),
                  children: [TextSpan(text: organizerName, style: AppText.b3b)],
                ),
              ),

              //* label
              if (!isCompleted) const SaveButtonWidgetComponent(),
            ],
          ),
        ],
      ),
    ),
  );
}
