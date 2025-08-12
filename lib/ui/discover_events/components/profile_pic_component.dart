import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class ProfilePicComponent extends StatelessWidget {
  const ProfilePicComponent({this.profilePicUrl, super.key, this.radius});

  final String? profilePicUrl;
  final double? radius;

  @override
  Widget build(final BuildContext context) {
    final effectiveRadius = radius ?? AppDimensions.width(15);
    final imagePath =
        (profilePicUrl?.isNotEmpty ?? false)
            ? profilePicUrl!
            : Assets.defaultUserProfile;

    return Container(
      width: effectiveRadius,
      height: effectiveRadius,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.profilePicBgColor,
      ),
      // padding: EdgeInsets.all(AppDimensions.width(2)),
      child: ClipOval(child: AppImage(imageUrl: imagePath)),
    );
  }
}
