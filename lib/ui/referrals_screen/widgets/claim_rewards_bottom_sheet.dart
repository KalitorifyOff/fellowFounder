import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/referrals_screen/widgets/claimed_popup_widget.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class ClaimRewardBottomSheet extends StatelessWidget {
  const ClaimRewardBottomSheet({required this.claimCallBack, super.key});
  final VoidCallback claimCallBack;
  //todo: component and widget

  @override
  Widget build(final BuildContext context) {
    const padding = AppDimensions.width;
    const height = AppDimensions.height;
    const priceAmount = 449;

    return SingleChildScrollView(
      child: Container(
        padding: Space.all(2, 1.5),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE6FEE8), Color(0xFFD3F5D9)],
            stops: [0.01, 1.0],
          ),
          //todo: normalz
          borderRadius: BorderRadius.vertical(top: Radius.circular(padding(6))),
        ),
        child: Column(
          spacing: AppDimensions.space(),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Title
            RichText(
              text: TextSpan(
                style: AppText.h2!.w(6).cl(AppColors.black),
                children: [
                  const TextSpan(text: S.enjoy),
                  TextSpan(
                    text: S.premium,
                    style: AppText.h2!.w(6).cl(AppColors.darkGreen),
                  ),
                  const TextSpan(text: S.featuresforfree),
                ],
              ),
            ),

            //* Subtitle
            Text(
              S.allowfellowfounders,
              style: AppText.b2b!.cl(AppColors.darkGreenBody),
            ),

            //* Price card
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: padding(5),
                vertical: height(2),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(padding(4)),
                border: Border.all(color: AppColors.darkGradientGreen),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF00351E),
                    Color(0xFF3E8860),
                    Color(0xFF002616),
                  ],
                  stops: [0.0, 0.3, 0.68],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mainPrimary.withAlpha(100),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //* Striked price
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '${S.rupeeSymbol} $priceAmount',
                        style: AppText.h2b!.cl(AppColors.white),
                      ),
                      Transform.rotate(
                        angle: -0.5,
                        child: Container(
                          width: padding(25),
                          height: height(0.5),
                          color: AppColors.orangeForCross,
                        ),
                      ),
                    ],
                  ),

                  //* Plan info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.unicornPlan, style: AppText.b2b!.cl(Colors.white)),
                      ShaderMask(
                        shaderCallback:
                            (final bounds) => const LinearGradient(
                              colors: [
                                AppColors.darkGradientGreen,
                                AppColors.mainPrimary,
                                AppColors.darkGradientGreen,
                              ],
                            ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        child: Text(
                          S.free,
                          style: AppText.h2b!.cl(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //* Additional note
            Text(S.getOneYear, style: AppText.b2b!.cl(AppColors.darkGreenBody)),

            //* Claim button
            PrimaryButton(
              onPressed: () async {
                claimCallBack();
                Navigator.pop(context);
                await showRewardCollectedPopup(context);
              },
              text: S.claimNow,
              textStyle: AppText.b3b!.cl(AppColors.darkGreenBody),
              alignment: Alignment.center,
              borderRadius: AppDimensions.borRadius(5),
              width: AppDimensions.width(80),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(208, 43, 161, 76),
                  Color(0xff77D18C),
                  Color(0xff77D18C),
                  Color.fromARGB(208, 43, 161, 76),
                ],
                stops: [0, 0.4, 0.6, 1],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
