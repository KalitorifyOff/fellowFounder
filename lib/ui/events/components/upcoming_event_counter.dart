part of '../event_screen.dart';

class _UpcomingEventCounter extends StatelessWidget {
  const _UpcomingEventCounter({required this.eventCount, required this.month});
  final int eventCount;
  final String month;

  @override
  Widget build(final BuildContext context) => Container(
    margin: Space.v1,
    padding: Space.vf(0.5),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.white,
          Color.fromARGB(106, 109, 222, 162),
          AppColors.white,
        ],
        stops: [0, 0.5, 1],
      ),
    ),
    child: Text(
      '${S.youHave} $eventCount ${S.eventsPlannedIn} $month',
      style: AppText.b3b,
    ),
  );
}
