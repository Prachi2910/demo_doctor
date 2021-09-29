import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:flutter/material.dart';

class VisualHandle extends StatelessWidget {
  const VisualHandle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      heightFactor: 4.0,
      child: Container(
        height: 6,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(kCardRadiusBig),
        ),
      ),
    );
  }
}
