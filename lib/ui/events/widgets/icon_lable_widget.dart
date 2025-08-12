import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class IconLableWidget extends StatelessWidget {
  const IconLableWidget({
    required this.label,
    required this.iconpath,
    super.key,
  });
  final String label;
  final String iconpath;

  @override
  Widget build(final BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    spacing: AppDimensions.space(),
    children: [
      AppImage(imageUrl: iconpath, size: AppDimensions.font(8)),
      Flexible(
        child: Text(label, overflow: TextOverflow.ellipsis, maxLines: 1),
      ),
    ],
  );
}
