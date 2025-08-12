import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';

class LabelComponent extends StatelessWidget {
  const LabelComponent({
    required this.text,
    this.bgColor = AppColors.indicatorColor3,
    this.textColor = AppColors.black,
    super.key,
  });
  final String text;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(final BuildContext context) => Container(
    padding: Space.all(0.4, 0.1),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: AppDimensions.borRadius(2),
    ),
    child: Text(
      text,
      style: AppText.b3!.cl(textColor).s(AppDimensions.font(5)),
    ),
  );
}
