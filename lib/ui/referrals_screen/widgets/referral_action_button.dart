import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class ReferralActionButton extends StatelessWidget {
  const ReferralActionButton({
    required this.onInvitePressed,
    required this.isSelected,
    required this.label,
    super.key,
  });

  final VoidCallback onInvitePressed;
  final bool isSelected;
  final String label;

  @override
  Widget build(final BuildContext context) => PrimaryButton(
    onPressed: onInvitePressed,
    text: label,
    textStyle: AppText.b3!.w(3).cl(isSelected ? AppColors.black : Colors.white),
    color: isSelected ? Colors.transparent : AppColors.black,
    height: AppDimensions.normalize(13),
    width: AppDimensions.normalize(40),
    alignment: Alignment.center,
    borderRadius: AppDimensions.borRadius(10),
    border: isSelected ? Border.all(color: AppColors.grey300) : null,
    padding: Space.z,
  );
}
