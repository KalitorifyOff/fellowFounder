import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/user_list_title_widget.dart';
import 'package:flutter/material.dart';

class InvitePeopleTabScreen extends StatelessWidget {
  const InvitePeopleTabScreen({
    required this.invitedList,
    required this.toggleInvite,
    super.key,
  });
  final List<bool> invitedList;
  final Function(int) toggleInvite;

  @override
  Widget build(final BuildContext context) => ListView.builder(
    padding: EdgeInsets.symmetric(
      horizontal: AppDimensions.width(5),
      vertical: AppDimensions.height(1.2),
    ),
    itemCount: invitedList.length,
    itemBuilder:
        (final context, final index) => Padding(
          padding: EdgeInsets.only(bottom: AppDimensions.height(2.5)),
          child: UserListTitleWidget(
            isInvited: invitedList[index],
            onInvitePressed: () => toggleInvite(index),
            name: S.name,
            phoneNumber: S.phoneNumberDigit,
            profileImageUrl: Assets.defaultUserProfile,
          ),
        ),
  );
}
