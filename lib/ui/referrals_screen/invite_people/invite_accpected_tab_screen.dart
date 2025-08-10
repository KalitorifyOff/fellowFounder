import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/claim_rewards_bottom_sheet.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/progress_bar_widget.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/user_list_title_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class InviteAcceptedTabScreen extends StatefulWidget {
  const InviteAcceptedTabScreen({
    required this.invitedList,
    this.prgressbarValue = 0,
    super.key,
  });
  final List<bool> invitedList;
  final int prgressbarValue;

  @override
  State<InviteAcceptedTabScreen> createState() =>
      _InviteAcceptedTabScreenState();
}

class _InviteAcceptedTabScreenState extends State<InviteAcceptedTabScreen> {
  bool isClaimed = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.prgressbarValue >= 3) {
        await showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder:
              (_) => ClaimRewardBottomSheet(
                claimCallBack: () {
                  setState(() {
                    isClaimed = true;
                  });
                },
              ),
        );
      }
    });
  }

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    primary: true,
    child: Column(
      children: [
        //* Main card
        Container(
          width: double.infinity,
          height: 350,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter, //##6DDEA2B2
              colors: [
                Colors.white,
                Color.fromARGB(130, 157, 234, 172),
                Colors.white,
              ],
              stops: [0, 0.5, 1.0],
            ),
          ),
          child: Column(
            spacing: AppDimensions.width(3),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* Image
              const AppImage(imageUrl: Assets.referral2),

              //* Claim rewards title
              Text(S.claimYourRewards, style: AppText.b2b!.cl(AppColors.black)),

              //* Progressbar
              ClaimProgressBar(
                borderWidth: 7,
                claimButtonHeight: 3.5,
                claimButtonWidth: 20,
                progressBarBorderRadius: 30,
                progressBarHeight: 5,
                progressBarWidth: 80,
                value: widget.prgressbarValue,
                isClaimed: isClaimed,
                claimCallBack: () {
                  setState(() {
                    isClaimed = true;
                  });
                },
              ),

              //* History title
              Text(S.rewardsHistory, style: AppText.b3!.cl(AppColors.grey500)),
            ],
          ),
        ),

        //* Accpected user list
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.width(5),
            vertical: AppDimensions.height(1.2),
          ),
          itemCount: widget.invitedList.length,
          itemBuilder:
              (final context, final index) => Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.height(2.5)),
                child: UserListTitleWidget(
                  isInvited: widget.invitedList[index],
                  onInvitePressed: () {},
                  name: S.name,
                  isConnected: true,
                  phoneNumber: S.phoneNumberDigit,
                  profileImageUrl: Assets.defaultUserProfile,
                ),
              ),
        ),
      ],
    ),
  );
}
