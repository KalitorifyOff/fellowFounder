import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MothTitleViewComponent extends StatelessWidget {
  const MothTitleViewComponent({required this.title, super.key});
  final String title;

  @override
  Widget build(final BuildContext context) => Row(
    children: [
      Stack(
        children: [
          const AppImage(imageUrl: Assets.titleDecoration),
          Padding(
            padding: Space.h!.l(0.5),
            child: Text(
              (title == DateFormat('MMMM').format(DateTime.now())
                  ? S.thisMonth
                  : title),
              style: AppText.b2b,
            ),
          ),
        ],
      ),
      const Expanded(child: Divider(color: AppColors.grey100)),
    ],
  );
}
