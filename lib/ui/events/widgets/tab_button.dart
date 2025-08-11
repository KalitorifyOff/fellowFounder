import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';

class TabButtonWidget extends StatelessWidget {
  const TabButtonWidget({
    required this.onPress,
    required this.isSelected,
    required this.title,
    super.key,
  });
  final GestureTapCallback onPress;
  final bool isSelected;
  final String title;

  @override
  Widget build(final BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        decoration:
            isSelected
                ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.mainPrimary, width: 2),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.white,
                      AppColors.white,
                      Color.fromARGB(77, 109, 222, 162),
                    ],
                    stops: [0, 0.90, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                )
                : null,
        padding: Space.v1,
        alignment: Alignment.center,
        child: Text(title, style: AppText.b3b),
      ),
    ),
  );
}
