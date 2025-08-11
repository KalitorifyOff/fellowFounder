import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.icon,
    this.margin,
  });

  final String text;
  final VoidCallback onPressed;
  final String? icon;
  final EdgeInsets? margin;

  static const RadialGradient _gradient = RadialGradient(
    radius: 3,
    colors: [
      Color(0xFFA3ECC5), // Outside
      Color(0xFF6DDEA2), // Inside
    ],
    stops: [0.0, 1.0],
  );

  @override
  Widget build(final BuildContext context) => PrimaryButton(
    text: text,
    onPressed: onPressed,
    margin: margin,
    borderRadius: AppDimensions.borRadius(5),
    width: AppDimensions.width(80),
    alignment: Alignment.center,
    gradient: _gradient,
    child:
        icon != null
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage(imageUrl: icon!, size: AppDimensions.font(8)),
                SizedBox(width: AppDimensions.width(2)),
                Text(text, style: AppText.b3b!.cl(AppColors.darkGreenBody)),
              ],
            )
            : Text(text, style: AppText.b3b!.cl(AppColors.darkGreenBody)),
  );
}
