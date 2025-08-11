import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/invite_people/invite_people_screen.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/time_line_widget.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/appbar_widget.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferralsScreen extends StatefulWidget {
  const ReferralsScreen({super.key});

  @override
  State<ReferralsScreen> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: AppBarWidget(
      showBackButton: true,
      title: S.referralsAndRewards,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.history))],
    ),
    body: AppColumn(
      padding: Space.all(1, 0),
      cstart: false,
      children: [
        //* Body Heading
        Padding(padding: Space.all(0, 1), child: titleWidget()),

        //* Image
        AppImage(
          imageUrl: Assets.referral1,
          height: AppDimensions.normalize(100),
          width: AppDimensions.normalize(100),
        ),

        //* Steps
        const ReferralStepsTimelineWidget(),

        //* Action session
        actionWidget(),
      ],
    ),
  );

  //* Title widget that locate in to of the screen
  Widget titleWidget() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: AppDimensions.width(2),
    children: [
      Text(S.referAFriend, style: AppText.b2b),
      GestureDetector(
        onTap: () {
          //* Add actions for info
        },
        child: Row(
          spacing: AppDimensions.width(3),
          children: [
            const Icon(Icons.info_outline, color: Colors.grey),
            Text(S.howItWorks, style: AppText.b3!.cl(Colors.grey)),
          ],
        ),
      ),
    ],
  );

  //* Actions
  Widget actionWidget() => Column(
    spacing: AppDimensions.height(4),
    children: [
      //* Copy referral link
      Container(
        padding: Space.all(1),
        decoration: BoxDecoration(
          color: const Color(0xFFE2F1FE),
          borderRadius: AppDimensions.borRadius(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'https://www.fellowfounder.in/',
              style: AppText.b3!.cl(const Color(0xFF002381)),
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(
                  const ClipboardData(text: 'https://www.fellowfounder.in/'),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text(S.linkCopied)));
              },
              child: Text(
                'Copy',
                style: AppText.b3b!.cl(const Color(0xFF002381)),
              ),
            ),
          ],
        ),
      ),

      //* Invite action button
      PrimaryButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (final context) => const InvitePeopleScreen(),
            ),
          );
        },
        text: S.invitePeople,
        textStyle: AppText.b2b!.cl(Colors.black).tsc(0.7),
        color: AppColors.mainPrimary,
        padding: Space.all(0.2),
        height: 40,
        width: 150,
        alignment: Alignment.center,
        borderRadius: AppDimensions.borRadius(2),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF95F5C2), Color(0xFF6DDEA2)],
        ),
        child: Row(
          spacing: AppDimensions.width(2),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppImage(
              imageUrl: 'assets/icons/users.png',
              height: 20,
              width: 20,
            ),
            Text(S.invitePeople, style: AppText.b3b),
          ],
        ),
      ),
    ],
  );
}
