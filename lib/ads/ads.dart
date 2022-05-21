// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';

class AdsManager {
  static bool testmode = true;
  static String get BannerAdUnitId {
    if (testmode == true) {
      return AdmobBanner.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3358381156926860/1240167502';
    }
    throw UnsupportedError('unsupported paltform');
  }

  static String get InterstitialAdUnitId {
    if (testmode == true) {
      return AdmobInterstitial.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3358381156926860/1539550407';
    }
    throw UnsupportedError('unsupported paltform');
  }

  static String get RewardBasedVideoAdUnitId {
    if (testmode == true) {
      return AdmobReward.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3358381156926860/8843325353';
    }
    throw UnsupportedError('unsupported paltform');
  }

  static String get NativeAdUnitId {
    if (testmode == true) {
      return AdmobReward.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3358381156926860/6221031440';
    }
    throw UnsupportedError('unsupported paltform');
  }
}
