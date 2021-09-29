import 'package:flutter/material.dart';

const double kSpaceZero = 0;
const double kSpaceTiny = 1;
const double kSpaceSmall = 4;
const double kSpaceNormal = 8;
const double kSpaceLittleBig = 12;
const double kSpaceBig = 16;
const double kSpaceLarge = 24;
const double kSpaceHuge = 32;
const double kSpaceGiant = 44;

const double kCardPadding = 16;
const double kListPadding = 14;
const double kInternalPadding = 12;
const double kInternalPaddingSmall = 8;
final double kContentPaddingSmall = 22;
final double kContentPadding = 26;
final double kContentPaddingBig = 28;

const double kCardRadiusExtraSmall = 4;
const double kCardRadiusSmall = 8;
const double kCardRadius = 16;
const double kCardRadiusBig = 32;
const double kCardRadiusHuge = 100;

class VerticalSpace extends StatelessWidget {
  final num space;
  const VerticalSpace(this.space);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(size: Size(0, space.toDouble()));
  }
}

class HorizontalSpace extends StatelessWidget {
  final num space;
  const HorizontalSpace(this.space);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(size: Size(space.toDouble(), 0));
  }
}
