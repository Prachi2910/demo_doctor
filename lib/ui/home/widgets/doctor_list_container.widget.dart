import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/constant/drawable.constants.dart';
import 'package:demo_doctor/support/star_rating.widget.dart';
import 'package:demo_doctor/ui/home/model/DoctosModel.dart';
import 'package:demo_doctor/ui/home/viewmodel/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_doctor/extensions/pixel.x.dart';

class DoctorsListContainer extends StatelessWidget {
  const DoctorsListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return FutureBuilder<DoctorsModel>(
        future: viewModel.getDoctorsData(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(kContentPadding),
                itemBuilder: (context, index) {
                  final doctor = snapshot.data!.doctors![index];
                  return Container(
                    padding: EdgeInsets.all(kListPadding),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kCardRadiusSmall)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60.dp,
                              width: 60.dp,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kCardRadius),
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kCardRadius),
                                  child:
                                      doctor.image != null && doctor.image != ""
                                          ? Image.network(doctor.image!,
                                              fit: BoxFit.cover)
                                          : Image.asset(icn_placeHolder,
                                              fit: BoxFit.cover)),
                            ),
                            HorizontalSpace(kSpaceLittleBig),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  VerticalSpace(kSpaceSmall),
                                  Text(
                                    doctor.profession!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  VerticalSpace(kSpaceNormal),
                                  Row(
                                    children: [
                                      StarRating(
                                        rating: doctor.rating ?? 0,
                                        color: Colors.orange,
                                        starCount: 5,
                                      ),
                                      HorizontalSpace(kSpaceLittleBig),
                                      Text(
                                        "${doctor.rating ?? 0.0}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.grey,
                                                fontSize: 12.dp),
                                      ),
                                      Text(
                                        " | ${doctor.reviews ?? 0} Reviews",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.grey,
                                                fontSize: 12.dp),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return VerticalSpace(kSpaceBig);
                },
                itemCount: snapshot.data?.doctors?.length ?? 0);
          } else {
            return SizedBox(
                height: 60.dp, child: Center(child: Text("No Doctors Found")));
          }
        });
  }
}
