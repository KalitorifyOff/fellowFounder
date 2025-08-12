import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/gradient_button.dart';
import 'package:flutter/material.dart';

class EmptyScreenBodyWidget extends StatelessWidget {
  const EmptyScreenBodyWidget({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isShowButton,
    super.key,
    this.buttonText,
    this.buttonIconPath,
    this.onTap,
  });
  final String imageUrl;
  final String title;
  final String description;
  final bool isShowButton;
  final String? buttonText;
  final String? buttonIconPath;
  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AppImage(imageUrl: imageUrl, size: AppDimensions.font(100)),

      Padding(padding: Space.v!.t(1), child: Text(title, style: AppText.b1b)),

      Text(
        description,
        style: AppText.b2!.cl(AppColors.grey500),
        textAlign: TextAlign.center,
      ),
      if (isShowButton) Space.y2!,

      if (isShowButton)
        GradientButton(
          onPressed: onTap ?? () {},
          text: buttonText ?? 'button',
          icon: buttonIconPath,
          margin: Space.hf(5),
        ),
    ],
  );
}
