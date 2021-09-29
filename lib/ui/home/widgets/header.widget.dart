import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/constant/drawable.constants.dart';
import 'package:demo_doctor/constant/misc.constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_doctor/extensions/pixel.x.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kContentPadding),
      child: Row(
        children: [
          Container(
            height: 35.dp,
            width: 35.dp,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kCardRadiusSmall),
            ),
            child: Icon(
              Icons.menu_rounded,
              color: Colors.grey,
              size: 24.dp,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Current location",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.location_on,
                        size: 14.dp,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      "Los Angeles",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 35.dp,
            width: 35.dp,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kCardRadiusSmall),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(kCardRadiusSmall),
                child: Image.asset(icn_placeHolder, fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
