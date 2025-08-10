import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app_login/constants/assets.dart';

void main() {
  test('assets assets test', () {
    expect(File(Assets.congrats).existsSync(), isTrue);
    expect(File(Assets.placeholder).existsSync(), isTrue);
    expect(File(Assets.referral1).existsSync(), isTrue);
    expect(File(Assets.referral2).existsSync(), isTrue);
    expect(File(Assets.titleUnderline).existsSync(), isTrue);
    expect(File(Assets.arrowRight).existsSync(), isTrue);
    expect(File(Assets.calls).existsSync(), isTrue);
    expect(File(Assets.defaultUserProfile).existsSync(), isTrue);
    expect(File(Assets.download).existsSync(), isTrue);
    expect(File(Assets.editAvatar).existsSync(), isTrue);
    expect(File(Assets.eyeClosed).existsSync(), isTrue);
    expect(File(Assets.eyeOpen).existsSync(), isTrue);
    expect(File(Assets.facebook).existsSync(), isTrue);
    expect(File(Assets.github).existsSync(), isTrue);
    expect(File(Assets.home).existsSync(), isTrue);
    expect(File(Assets.instagram).existsSync(), isTrue);
    expect(File(Assets.linkedin).existsSync(), isTrue);
    expect(File(Assets.mail).existsSync(), isTrue);
    expect(File(Assets.messageIcon).existsSync(), isTrue);
    expect(File(Assets.passwordLock).existsSync(), isTrue);
    expect(File(Assets.profileIcon).existsSync(), isTrue);
    expect(File(Assets.users).existsSync(), isTrue);
    expect(File(Assets.web).existsSync(), isTrue);
    expect(File(Assets.whatsapp).existsSync(), isTrue);
  });
}
