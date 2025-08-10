import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/invite_people/invite_accpected_tab_screen.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/invite_people/invite_people_tab_screen.dart';
import 'package:ecommerce_app_login/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class InvitePeopleScreen extends StatefulWidget {
  const InvitePeopleScreen({super.key});

  @override
  State<InvitePeopleScreen> createState() => _InvitePeopleScreenState();
}

class _InvitePeopleScreenState extends State<InvitePeopleScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<bool> invitedList = List.generate(20, (final index) => false);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleInvite(final int index) {
    setState(() {
      invitedList[index] = !invitedList[index];
    });
  }

  int get invitedCount => invitedList.where((final invited) => invited).length;

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: const AppBarWidget(
      showBackButton: true,
      title: S.referralsAndRewards,
    ),
    backgroundColor: AppColors.white,
    body: Column(
      children: [
        //* Tab View
        DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9))),
          ),
          child: TabBar(
            controller: _tabController,
            overlayColor: WidgetStateProperty.all(
              Colors.white.withValues(alpha: 0.2),
            ),
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.grey300,
            labelStyle: AppText.b2!.w(7),
            unselectedLabelStyle: AppText.b2!.w(7),
            indicatorColor: AppColors.transparent,
            tabs: const [
              Tab(text: S.invitePeople),
              Tab(text: S.inviteAccepted),
            ],
          ),
        ),

        //* Tab's Screens
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              //* Invite people tab
              InvitePeopleTabScreen(
                invitedList: invitedList,
                toggleInvite: toggleInvite,
              ),

              //* invite accepted tab
              InviteAcceptedTabScreen(
                invitedList: invitedList,
                prgressbarValue: invitedCount,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
