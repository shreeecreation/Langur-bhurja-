import 'dart:math';
import 'package:flutter/widgets.dart';

class AdaptiveHelper {
  AdaptiveHelper._();

  factory AdaptiveHelper() {
    return _instance;
  }

  static final AdaptiveHelper _instance = AdaptiveHelper._();

  /// default size of figma/adobe xd design
  static const Size defaultSize = Size(360, 690);

  /// device screen width
  late double _screenWidth;

  ///device screen height
  late double _screenHeight;

  ///scale width
  late double _scaleWidth;

  ///scale height
  late double _scaleHeight;

  ///text scale factor
  late double _textScaleFactor;

  static void init({
    required BoxConstraints constraints,
    Size designSize = defaultSize,
  }) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final scaleWidth = width / designSize.width;
    final scaleHeight = height / designSize.height;
    final textScaleFactor = scaleWidth;
    _instance
      .._screenWidth = constraints.maxWidth
      .._screenHeight = constraints.maxHeight
      .._scaleWidth = scaleWidth
      .._scaleHeight = scaleHeight
      .._textScaleFactor = textScaleFactor;
  }

  double get width => _screenWidth;

  double get height => _screenHeight;

  double setWidth(num width) => width * _scaleWidth;

  double setHeight(num height) => height * _scaleHeight;

  double setSp(num sp) => sp * _textScaleFactor;

  double radius(num r) => r * min(_scaleWidth, _scaleHeight);

  Widget setVerticalSpacing(num height) => SizedBox(height: setHeight(height));

  Widget setVerticalSpacingRadius(num height) => SizedBox(height: radius(height));

  Widget setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));

  Widget setHorizontalSpacingRadius(num width) => SizedBox(width: radius(width));
}
