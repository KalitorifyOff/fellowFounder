import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/discover_events/components/bottom_sheet_component.dart';
import 'package:ecommerce_app_login/ui/discover_events/components/lable_component.dart';
import 'package:ecommerce_app_login/ui/discover_events/components/profile_pic_component.dart';
import 'package:ecommerce_app_login/ui/discover_events/model/discovet_event_model.dart';
import 'package:ecommerce_app_login/utils/routes.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class EventComponent extends StatelessWidget {
  const EventComponent({required this.event, super.key});
  final Event event;

  Future<void> _showModalForm({
    required final BuildContext context,
    required final VoidCallback onJoin,
    final double? maxHeight,
    final double? minHeight,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.normalize(7)),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: AppDimensions.height(maxHeight ?? 95),
        minHeight: AppDimensions.height(minHeight ?? 50),
      ),
      backgroundColor: AppColors.transparent,
      builder:
          (final context) => DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 176, 250, 214), AppColors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  margin: Space.v1,
                  width: AppDimensions.width(10),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: AppColors.white,
                  ),
                  height: AppDimensions.font(2.5),
                ),
                Expanded(
                  child: DiscoverEventBottomSheetComponent(event: event),
                ),
                PrimaryButton(
                  onPressed: () {
                    AppRoutes.pop(context);
                  },
                  color: Colors.white,
                  margin: Space.h,
                  textStyle: AppText.b2!.w(6).cl(AppColors.white),
                  text: 'hiii',
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ), // For scrolling
              ],
            ),
          ),
    );
  }

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: () => _showModalForm(context: context, onJoin: () {}),
    child: Container(
      margin: Space.all(),
      padding: Space.all(1.3, 0),
      decoration: BoxDecoration(
        color: AppColors.cardBGColor,
        borderRadius: AppDimensions.borRadius(5),
        border: Border.all(color: AppColors.borderColors),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(63, 138, 146, 151),
            blurRadius: 10,
            offset: Offset(3.33, 3.33),
          ),
        ],
      ),
      child: Row(
        spacing: AppDimensions.space(),
        children: [
          //* Profile img
          ProfilePicComponent(profilePicUrl: event.organizerPic, radius: 80),

          //* Details
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppDimensions.height(0.2),
            children: [
              Text(event.name, style: AppText.b3b),
              Text(
                event.profession,
                style: AppText.b3!
                    .cl(AppColors.grey300)
                    .s(AppDimensions.font(5)),
              ),
              Padding(
                padding: Space.z!.t(0.3),
                child: const LabelComponent(text: S.viewEvents),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
