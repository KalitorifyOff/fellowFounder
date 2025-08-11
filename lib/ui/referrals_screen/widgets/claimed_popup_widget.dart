import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

Future<void> showRewardCollectedPopup(final BuildContext context) async {
  //todo: use class -
  await showDialog(
    context: context,
    builder:
        (final context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borRadius(10),
          ),
          insetPadding: Space.hf(0.6),
          child: Padding(
            padding: Space.all(1.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //* Title
                Padding(
                  padding: Space.z!.b(2),
                  child: Text(S.congratulations, style: AppText.b1b),
                ),

                //* Subtitle
                Text(
                  S.rewardSuccessMessage,
                  textAlign: TextAlign.center,
                  style: AppText.b2,
                ),

                //* Illustration
                AppImage(
                  imageUrl: Assets.congrats,
                  height: AppDimensions.normalize(100),
                  width: AppDimensions.normalize(80),
                ),

                //* Footer note
                Text(
                  S.rewardSuccessWarningMessage,
                  textAlign: TextAlign.center,
                  style: AppText.b3!.cl(AppColors.grey500),
                ),
              ],
            ),
          ),
        ),
  );
}
