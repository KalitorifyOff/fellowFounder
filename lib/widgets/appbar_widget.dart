import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({required this.title, this.showBackButton = false, this.actions, super.key});
  final bool showBackButton;
  final String title;
  final List<Widget>? actions;


  @override
  Widget build(final BuildContext context) => AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      elevation: 0,
      title: Stack(
        children: [
          //* Back button
          if(showBackButton)
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          //* Title with underline decoration
          Padding(
            padding: Space.v1!.t(0.8).b(0.5),
            child: Column(
              children: [
                Align(
                  child: Column(
                    spacing: AppDimensions.height(0.5),
                    children: [
                      Text(title, style: AppText.b2b),
                      const AppImage(imageUrl: Assets.titleUnderline),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //* Actions for appbar
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [...?actions]
          ),
        ],
      ),
    );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
