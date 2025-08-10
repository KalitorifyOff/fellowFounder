import 'package:ecommerce_app_login/constants/assets.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:flutter/material.dart';

Future<void> showRewardCollectedPopup(final BuildContext context) async {
  await showDialog(
    context: context,
    builder:
        (final context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //* Title
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 8),

                //* Subtitle
                const Text(
                  'Your Reward has been Successfully Collected',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),

                const SizedBox(height: 16),

                //* Illustration
                const AppImage(
                  imageUrl: Assets.congrats,
                  height: 260,
                  width: 230,
                ),

                const SizedBox(height: 16),

                //* Footer note
                Text(
                  'If you are still facing trouble,\nWait for 3–5 business days',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
  );
}
