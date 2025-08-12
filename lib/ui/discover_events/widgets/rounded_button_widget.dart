import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({required this.onTap, this.icon, super.key});
  final IconData? icon;
  final GestureTapCallback onTap;

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: AppDimensions.borRadius(50),
      child: Container(
        padding: Space.all(0.4),
        // margin: Space.all(0.2),
        decoration: BoxDecoration(
          color: AppColors.grey500,
          borderRadius: AppDimensions.borRadius(50),
        ),
        child: Icon(icon ?? Icons.arrow_back_outlined, color: AppColors.white),
      ),
    ),
  );
}
