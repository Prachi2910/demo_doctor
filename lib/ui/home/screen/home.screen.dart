import 'package:demo_doctor/constant/colors.constants.dart';
import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/constant/validation.constants.dart';
import 'package:demo_doctor/support/textfield.widget.dart';
import 'package:demo_doctor/ui/home/viewmodel/home.viewmodel.dart';
import 'package:demo_doctor/ui/home/widgets/doctor_list.widget.dart';
import 'package:demo_doctor/ui/home/widgets/header.widget.dart';
import 'package:demo_doctor/ui/home/widgets/tinder_card_container.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:demo_doctor/extensions/pixel.x.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      builder: (context, child) {
        return HomeBody();
      },
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: kContentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              VerticalSpace(kSpaceHuge),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kContentPadding),
                child: CommonTextfield(
                  textKey: viewModel.searchFormFieldKey,
                  focusNode: viewModel.searchFocusNode,
                  showUnderLine: false,
                  filled: true,
                  textOption: TextFieldOption(
                    hintText: "Search a doctor or health issue",
                    maxLine: 1,
                    prefixWid: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kInternalPaddingSmall),
                      child: Icon(
                        Icons.search,
                        color: Colors.indigo,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    inputController: viewModel.searchTextController,
                    formatter: [
                      FilteringTextInputFormatter.deny(
                          RegExp(RegexForTextField))
                    ],
                  ),
                  textCallback: (text) {},
                  inputAction: TextInputAction.done,
                ),
              ),
              VerticalSpace(kSpaceHuge),
              TinderContainerWidget(),
              VerticalSpace(kSpaceHuge),
              DoctorListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
