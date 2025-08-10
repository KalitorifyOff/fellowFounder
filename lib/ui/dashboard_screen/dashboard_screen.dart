import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/dashboard_screen/widgets/bar_chart_widget.dart';
import 'package:ecommerce_app_login/ui/dashboard_screen/widgets/dashboard_core_widget.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

enum FilterType { today, oneWeek, oneMonth, custom }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ValueNotifier<FilterType> selectedFilter = ValueNotifier(
    FilterType.today,
  );
  final ValueNotifier<DateTime> selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> fromDate = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> toDate = ValueNotifier(DateTime.now());

  String getFilterLabel(final FilterType type) {
    switch (type) {
      case FilterType.today:
        return S.today;
      case FilterType.oneWeek:
        return S.oneWeek;
      case FilterType.oneMonth:
        return S.oneMonth;
      case FilterType.custom:
        return S.custom;
    }
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: AppColors.screenBg,
    appBar: const AppBarWidget(showBackButton: true, title: S.dashboard),
    body: AppColumn(
      cstart: false,
      children: [
        //* Dashboard Indicators Widget
        const GradientContainer(
          children: [
            IndicatorWidget(title: S.profileVisit, value: '200'),
            IndicatorWidget(title: S.socialClicks, value: '20'),
            IndicatorWidget(title: S.connections, value: '10'),
          ],
        ),

        //* Details
        Padding(
          padding: Space.all(0.5, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Filter Button Widget
              FilterButtonWidget(selectedFilter: selectedFilter),

              //* Date Filter Widget
              Padding(
                padding: Space.vf(0.8),
                child: DateFilterView(
                  fromDate: fromDate,
                  toDate: toDate,
                  selectedDay: selectedDay,
                  selectedFilter: selectedFilter,
                ),
              ),

              //* Bar Chart Widget
              Column(
                children: [
                  //* Bar Chart Widget
                  Container(
                    padding: Space.v1,
                    height: 300,
                    child: const TripleBarChart(),
                  ),

                  //* Bar Chart's rod's indicator
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BarRodIndicator(
                        color: Colors.green,
                        label: S.profileVisit,
                      ),
                      BarRodIndicator(
                        color: Colors.black87,
                        label: S.socialClicks,
                      ),
                      BarRodIndicator(
                        color: Colors.greenAccent,
                        label: S.connections,
                      ),
                    ],
                  ),
                ],
              ),

              //* General Widget
              const TitleWidget(title: S.general),
              Column(
                spacing: AppDimensions.space(),
                children: const [
                  ListCardWidget(
                    imgPath: Assets.calls,
                    title: S.calls,
                    count: 25,
                  ),
                  ListCardWidget(
                    imgPath: Assets.mail,
                    title: S.emails,
                    count: 25,
                  ),
                  ListCardWidget(
                    imgPath: Assets.web,
                    title: S.connections,
                    count: 25,
                  ),
                  ListCardWidget(
                    imgPath: Assets.download,
                    title: S.filesDownloaded,
                    count: 25,
                  ),
                ],
              ),

              //* Social Clicks
              const TitleWidget(title: S.socialClicks),
              Column(
                spacing: AppDimensions.space(),
                children: const [
                  ListCardWidget(
                    imgPath: Assets.whatsapp,
                    title: S.whatsappMessage,
                    count: 25,
                  ),
                  ListCardWidget(
                    imgPath: Assets.instagram,
                    title: S.instagramClicks,
                    count: 25,
                  ),
                  ListCardWidget(
                    imgPath: Assets.facebook,
                    title: S.facebookClicks,
                    count: 25,
                  ),
                  ListCardWidget(
                    imgPath: Assets.linkedin,
                    title: S.linkedinClicks,
                    count: 25,
                  ),
                  ListCardWidget(
                    imgPath: Assets.github,
                    title: S.githubClicks,
                    count: 25,
                  ),
                ],
              ),

              //* Contacts
              const TitleWidget(title: S.contacts),
              Column(
                spacing: AppDimensions.space(),
                children: const [
                  ListCardWidget(title: S.totalConnections, count: 25),
                  ListCardWidget(title: S.cardPictures, count: 25),
                  ListCardWidget(title: S.contactsCreated, count: 25),
                ],
              ),

              //* Events
              const TitleWidget(title: S.events),
              Column(
                spacing: AppDimensions.space(),
                children: const [
                  ListCardWidget(title: S.totalEventsRegistered, count: 25),
                  ListCardWidget(title: S.totalEventsAttended, count: 25),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
