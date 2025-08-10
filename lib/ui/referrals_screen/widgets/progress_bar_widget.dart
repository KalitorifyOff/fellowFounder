import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/claimed_popup_widget.dart';
import 'package:flutter/material.dart';

class ClaimProgressBar extends StatelessWidget {
  const ClaimProgressBar({
    required this.value,
    required this.progressBarWidth,
    required this.progressBarHeight,
    required this.borderWidth,
    required this.progressBarBorderRadius,
    required this.claimButtonWidth,
    required this.claimButtonHeight,
    required this.claimCallBack,
    required this.isClaimed,
    super.key,
  });

  final int value;
  final double progressBarWidth;
  final double progressBarHeight;
  final double borderWidth;
  final double progressBarBorderRadius;
  final double claimButtonWidth;
  final double claimButtonHeight;
  final VoidCallback claimCallBack;
  final bool isClaimed;

  @override
  Widget build(final BuildContext context) => Container(
    width: AppDimensions.width(progressBarWidth),
    height: AppDimensions.height(progressBarHeight),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white, width: borderWidth),
      borderRadius: BorderRadius.circular(progressBarBorderRadius),
    ),
    child: LayoutBuilder(
      builder: (final context, final constraints) {
        final valueCopy = isClaimed ? 4 : ((3 >= value) ? value : 3);
        final segmentWidth = constraints.maxWidth / 4;
        final fillWidth = segmentWidth * valueCopy;
        final isActive = value >= 3;

        return Stack(
          children: [
            // Background
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(30, 8, 208, 48),
                borderRadius: BorderRadius.circular(progressBarBorderRadius),
              ),
            ),

            // Filled part
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: fillWidth,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff2BA14D),
                    Color(0xff77D18C),
                    Color(0xff18943D),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(progressBarBorderRadius),
                  bottomLeft: Radius.circular(progressBarBorderRadius),
                  topRight:
                      isClaimed
                          ? Radius.circular(progressBarBorderRadius)
                          : Radius.zero,
                  bottomRight:
                      isClaimed
                          ? Radius.circular(progressBarBorderRadius)
                          : Radius.zero,
                ),
              ),
            ),

            // Claimed text
            if (isClaimed)
              Center(
                child: Text(
                  'Claimed',
                  style: AppText.b2b!.cl(AppColors.darkGreen),
                ),
              ),

            // Dividers
            if (!isClaimed)
              for (int i = 1; i < 4; i++)
                Positioned(
                  left: segmentWidth * i,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                    padding: Space.z!.t(0.3).b(0.3),
                    child: Container(width: 2, color: Colors.white),
                  ),
                ),

            // Claim button
            if (!isClaimed)
              Positioned(
                right: 0,
                child: InkWell(
                  onTap:
                      isActive
                          ? () async {
                            claimCallBack();
                            await showRewardCollectedPopup(context);
                          }
                          : null,
                  child: Container(
                    width: AppDimensions.width(claimButtonWidth),
                    height: AppDimensions.height(claimButtonHeight),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(progressBarBorderRadius),
                        bottomRight: Radius.circular(progressBarBorderRadius),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.claim,
                        style: AppText.b2b!.cl(
                          isActive ? Colors.white : Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    ),
  );
}
