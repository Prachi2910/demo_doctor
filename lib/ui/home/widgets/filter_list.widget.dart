import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/ui/home/viewmodel/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_doctor/extensions/pixel.x.dart';

class FilterListWidget extends StatelessWidget {
  const FilterListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return SizedBox(
      height: 50.dp,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: kContentPadding),
        itemCount: viewModel.doctorFilter.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              viewModel.setFilter(index);
            },
            child: AnimatedContainer(
              padding: EdgeInsets.all(kInternalPaddingSmall),
              decoration: BoxDecoration(
                  color: (viewModel.selectedFilter == index)
                      ? Colors.white
                      : Colors.transparent,
                  border: Border.all(
                      color: (viewModel.selectedFilter == index)
                          ? Colors.transparent
                          : Colors.grey.withOpacity(.2)),
                  borderRadius: BorderRadius.circular(kCardRadius)),
              duration: Duration(milliseconds: 100),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kCardRadius),
                          color: Colors.grey.withOpacity(.1)),
                      child: Image.asset(
                        viewModel.doctorFilter[index].image!,
                      )),
                  HorizontalSpace(kSpaceNormal),
                  Text(
                    viewModel.doctorFilter[index].name!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return HorizontalSpace(kSpaceBig);
        },
      ),
    );
  }
}
