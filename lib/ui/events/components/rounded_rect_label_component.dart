import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';

class RoundedRectLabelComponent extends StatelessWidget {
  const RoundedRectLabelComponent({required this.labelValue, super.key});
  final String labelValue;

  @override
  Widget build(final BuildContext context) => Container(
    padding: Space.all(0.7, 0.3),
    decoration: BoxDecoration(
      borderRadius: AppDimensions.borRadius(2),
      color: AppColors.lightBGGreen,
    ),
    child: Text(labelValue, style: AppText.b3!.cl(AppColors.white).s(10)),
  );
}
