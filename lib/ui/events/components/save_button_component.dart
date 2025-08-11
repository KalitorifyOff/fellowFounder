import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class SaveButtonWidgetComponent extends StatelessWidget {
  const SaveButtonWidgetComponent({super.key});

  @override
  Widget build(final BuildContext context) => PrimaryButton.withChild(
    onPressed: () {},
    color: AppColors.transparent,
    padding: Space.z,
    child: Container(
      padding: Space.all(0.7, 0.3),
      decoration: BoxDecoration(
        borderRadius: AppDimensions.borRadius(6),
        color: AppColors.mainPrimary,
      ),
      child: Row(
        spacing: AppDimensions.width(1),
        children: [
          const AppImage(imageUrl: Assets.bookmarkCheck),
          Text('Saved', style: AppText.b3!.s(10)),
        ],
      ),
    ),
  );
}
