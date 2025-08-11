part of '../event_screen.dart';

class _EmptyEventScreen extends StatelessWidget {
  const _EmptyEventScreen();

  @override
  Widget build(final BuildContext context) => Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImage(
          imageUrl: Assets.emptyUpcomingEvents,
          size: AppDimensions.font(100),
        ),

        Padding(
          padding: Space.v!.t(1),
          child: Text(S.nothingOnYourCalendar, style: AppText.b1b),
        ),

        Text(
          S.planYourFirstEvent,
          style: AppText.b2!.cl(AppColors.grey500),
          textAlign: TextAlign.center,
        ),
        Space.y2!,

        GradientButton(
          onPressed: () {},
          text: S.createEvents,
          icon: Assets.calendarPlus1,
          margin: Space.hf(5),
        ),
      ],
    ),
  );
}
