import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/constant/drawable.constants.dart';
import 'package:demo_doctor/constant/misc.constants.dart';
import 'package:demo_doctor/support/tinder_card.widget.dart';
import 'package:demo_doctor/ui/home/model/Schedule.dart';
import 'package:demo_doctor/ui/home/model/ScheduleModel.dart';
import 'package:demo_doctor/ui/home/viewmodel/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_doctor/extensions/pixel.x.dart';

class TinderContainerWidget extends StatelessWidget {
  const TinderContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kContentPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Upcoming Schedule",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See all",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<ScheduleModel>(
            future: viewModel.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment.topCenter,
                  child: TinderSwapCard(
                    swipeUp: true,
                    swipeDown: true,
                    orientation: AmassOrientation.bottom,
                    totalNum: snapshot.data?.schedule?.length ?? 0,
                    stackNum: 3,
                    swipeEdge: 4,
                    maxWidth: MediaQuery.of(context).size.width * 0.95,
                    maxHeight: MediaQuery.of(context).size.width * 0.48,
                    minWidth: MediaQuery.of(context).size.width * 0.78,
                    minHeight: MediaQuery.of(context).size.width * 0.44,
                    cardBuilder: (context, index) {
                      final schedule = snapshot.data!.schedule![index];
                      return TinderContentContainer(schedule: schedule);
                    },
                    cardController: viewModel.tinderController,
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      /// Get swiping card's alignment
                      if (align.x < 0) {
                        //Card is LEFT swiping
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      /// Get orientation & index of swiped card!
                    },
                  ),
                );
              } else {
                return SizedBox(
                    height: 60.dp,
                    child: Center(child: Text("No Schedules Found")));
              }
            })
      ],
    );
  }
}

class TinderContentContainer extends StatelessWidget {
  const TinderContentContainer({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(.98),
          borderRadius: BorderRadius.circular(kCardRadius),
          boxShadow: getDefaultBoxShadow()),
      child: Padding(
        padding: EdgeInsets.all(kContentPaddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50.dp,
                  width: 50.dp,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(kCardRadiusSmall),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(kCardRadiusSmall),
                      child: schedule.image != null && schedule.image != ""
                          ? Image.network(schedule.image!, fit: BoxFit.cover)
                          : Image.asset(icn_placeHolder, fit: BoxFit.cover)),
                ),
                HorizontalSpace(kSpaceLittleBig),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule.name!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        schedule.profession!,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                HorizontalSpace(kSpaceNormal),
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kCardRadius)),
                    child: Icon(
                      Icons.videocam_outlined,
                      color: Colors.indigo,
                      size: 16.dp,
                    ))
              ],
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: kContentPaddingSmall, horizontal: kCardPadding),
              decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(kCardRadiusSmall)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.watch_later,
                    size: 16.dp,
                    color: Colors.white54,
                  ),
                  HorizontalSpace(kSpaceNormal),
                  Text(
                    schedule.date!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
