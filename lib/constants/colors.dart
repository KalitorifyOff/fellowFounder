part of 'resources.dart';

class AppColors {
  static const Color primary = Color.fromRGBO(218, 94, 66, 1);

  static const Color grey900 = Color(0xff191C1E);

  static const Color grey500 = Color(0xff757779);

  static const Color grey700 = Color(0xff444749);

  static const Color grayishBlue = Color(0xff45464E);

  static const Color grey100 = Color(0xffE1E2E4);

  static const Color grey300 = Color(0xff8A9297);

  static const Color darkRed = Color(0xffBA1B1B);

  static const Color screenBg = Color(0xffF4F7F9);

  static const Color gradientColor1 = Color(0xff080808);

  static const Color gradientColor2 = Color(0xff373737);

  static const Color mainPrimary = Color(0xff6DDEA2);

  static const Color titleTextColor = Color(0xff26323880);

  static const Color white = Colors.white;

  static const Color black = Colors.black;

  static const Color transparent = Colors.transparent;

  static const Color borderColors = Color(0xFFD9D9D9);

  static const Color indicatorColor1 = Colors.green;

  static const Color indicatorColor2 = Colors.black87;

  static const Color indicatorColor3 = Colors.greenAccent;

  static const Color profilePicBgColor = Color(0xffD0D0D0);

  static const Color darkGreen = Color(0xff20583c);

  static const Color darkGreenBody = Color(0xff2f4035);

  static const Color darkGradientGreen = Color(0xff14883C); //#14883C

  static const Color orangeForCross = Color(0xffeb6601);

  static const Color lightBGGreen = Color(0xff68BAA5);

  static const Color lightBGYellow = Color(0xffDFB663);

  static const Color lightBGOrange = Color(0xffDE8D41);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);

  // static const Color a = Color(0xff);
}

extension ColorExtensions on Color {
  Color adjustOpacity(final double opacity) => withValues(alpha: opacity);
}
