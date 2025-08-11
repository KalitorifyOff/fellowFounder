part of '../event_screen.dart';

class _TabHeaderItem extends StatelessWidget {
  const _TabHeaderItem({required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(final BuildContext context) => Container(
    decoration:
        isSelected
            ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.mainPrimary, width: 2),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(
                    109,
                    222,
                    162,
                    0.6,
                  ), // rgba(109, 222, 162, 0.6)
                  Color.fromRGBO(
                    244,
                    247,
                    249,
                    0.6,
                  ), // rgba(244, 247, 249, 0.6)
                ],
                stops: [-0.0816, 0.164], // matching -8.16% and 16.4%
              ),
            )
            : null,
    padding: Space.vf(0.75),
    width: AppDimensions.width(50),
    alignment: Alignment.center,
    child: Text(title, style: AppText.b3!.w(6).cl(Colors.black).pop()),
  );
}
