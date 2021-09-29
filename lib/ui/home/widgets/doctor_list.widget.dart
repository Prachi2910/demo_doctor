import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/ui/home/widgets/filter_list.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_doctor/extensions/pixel.x.dart';
import 'doctor_list_container.widget.dart';

class DoctorListWidget extends StatelessWidget {
  const DoctorListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kContentPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Lets find your doctor",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.toc_sharp,
                  color: Colors.indigo,
                  size: 26.dp,
                ),
              ),
            ],
          ),
        ),
        VerticalSpace(kSpaceBig),
        FilterListWidget(),
        VerticalSpace(kSpaceSmall),
        DoctorsListContainer()
      ],
    );
  }
}
