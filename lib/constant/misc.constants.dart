import 'package:demo_doctor/constant/colors.constants.dart';
import 'package:flutter/material.dart';

import 'dimens.constants.dart';

List<BoxShadow> getDefaultBoxShadow(
    {List<Color> color = const [Colors.black26], double elevation = 1}) {
  return color
      .map(
        (e) => BoxShadow(
          color: e,
          offset: Offset(1 * elevation, 2 * elevation),
          blurRadius: 2.0 * elevation,
        ),
      )
      .toList();
}

void setFocus({required BuildContext context, FocusNode? node}) {
  if (node == null) {
    Focus.of(context).dispose();
  }
  FocusScope.of(context).requestFocus(node);
}

ButtonStyle textButtonStyle() {
  return TextButton.styleFrom(
    backgroundColor: accentGreen,
    padding: EdgeInsets.all(kListPadding),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCardRadiusSmall),
    ),
  );
}
