import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/referral_action_button.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class UserListTitleWidget extends StatelessWidget {
  const UserListTitleWidget({
    required this.isInvited,
    required this.onInvitePressed,
    required this.name,
    required this.phoneNumber,
    required this.profileImageUrl,
    this.isConnected = false,
    super.key,
  });

  final bool isInvited;
  final VoidCallback onInvitePressed;
  final String name;
  final String phoneNumber;
  final String profileImageUrl;
  final bool isConnected;

  @override
  Widget build(final BuildContext context) => Row(
    children: [
      //* User profile image
      Padding(
        padding: Space.z!.r(1.3),
        child: Container(
          width: AppDimensions.width(15),
          height: AppDimensions.width(15),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.profilePicBgColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.width(2)),
            child: AppImage(imageUrl: profileImageUrl),
          ),
        ),
      ),

      //* Name and phone number
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppText.b2b!.w(8).cl(AppColors.black)),
            Text(phoneNumber, style: AppText.b3!.w(5).cl(AppColors.grey500)),
          ],
        ),
      ),

      //* primary actiton btn
      ReferralActionButton(
        onInvitePressed: onInvitePressed,
        // ignore: avoid_bool_literals_in_conditional_expressions
        isSelected: isConnected ? true : isInvited,
        label:
            isConnected
                ? S.connected
                : isInvited
                ? S.invited
                : S.invite,
      ),
    ],
  );
}
