import 'dart:collection';
import 'dart:convert';

import 'package:demo_doctor/utils/pref.util.dart';
import 'package:flutter/material.dart';

double getSize(double px) {
  return MathUtilities.getInstance().getWidth(px);
}

class MathUtilities {
  static final MathUtilities _utils = MathUtilities();
  int width;
  bool allowFontScaling;
  static double _screenWidth = 414;
  static double _screenHeight = 736;
  static double _pixelRatio = 2;
  static double _statusBarHeight = 24;
  static double _bottomBarHeight = 48;
  static double _textScaleFactor = 1;

  MathUtilities({
    this.width = 414,
    this.allowFontScaling = false,
  });

  static MathUtilities getInstance() {
    return _utils;
  }

  Future init(BuildContext context) async {
    Map<String, dynamic> screenDataMap = HashMap();
    if ((await PrefUtils().getStringAsync('MEDIAQUERY')).isEmpty) {
      final mediaQuery = MediaQuery.of(context);
      screenDataMap['devicePixelRatio'] = mediaQuery.devicePixelRatio;
      screenDataMap['width'] = mediaQuery.size.width;
      screenDataMap['height'] = mediaQuery.size.height;
      screenDataMap['top'] = mediaQuery.padding.top;
      screenDataMap['bottom'] = mediaQuery.padding.bottom;
      screenDataMap['textScaleFactor'] = mediaQuery.textScaleFactor;
      await PrefUtils()
          .saveStringAsync('MEDIAQUERY', jsonEncode(screenDataMap));
    } else {
      screenDataMap = jsonDecode(await PrefUtils().getStringAsync('MEDIAQUERY'))
          as Map<String, dynamic>;
    }
    _pixelRatio = screenDataMap['devicePixelRatio'] as double;
    _screenWidth = screenDataMap['width'] as double;
    _screenHeight = screenDataMap['height'] as double;
    _statusBarHeight = screenDataMap['top'] as double;
    _bottomBarHeight = screenDataMap['bottom'] as double;
    _textScaleFactor = screenDataMap['textScaleFactor'] as double;
  }

  static double get textScaleFactory => _textScaleFactor;
  static double get pixelRatio => _pixelRatio;
  static double get screenWidthDp => _screenWidth;
  static double get screenHeightDp => _screenHeight;

  static double get screenWidth => _screenWidth * _pixelRatio;
  static double get screenHeight => _screenHeight * _pixelRatio;
  static double get statusBarHeight => _statusBarHeight * _pixelRatio;
  static double get bottomBarHeight => _bottomBarHeight * _pixelRatio;

  double get scaleWidth => _screenWidth / _utils.width;

  double getWidth(double width) => width * scaleWidth;

  double? getSp(double fontSize) {
    return allowFontScaling
        ? getWidth(fontSize)
        : getWidth(fontSize) / _textScaleFactor;
  }
}
