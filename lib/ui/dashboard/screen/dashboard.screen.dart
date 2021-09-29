import 'package:demo_doctor/constant/colors.constants.dart';
import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/constant/misc.constants.dart';
import 'package:demo_doctor/ui/dashboard/viewmodel/dashboard.viewmodel.dart';
import 'package:demo_doctor/ui/dashboard/widgets/dashboard_indicator.widget.dart';
import 'package:demo_doctor/ui/home/screen/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardViewModel>(
      create: (_) => DashboardViewModel(),
      builder: (context, child) {
        return DashboardBody();
      },
    );
  }
}

class DashboardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardViewModel>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: getDefaultBoxShadow(elevation: 4),
              color: Colors.white),
          child: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.indigo,
            labelPadding: EdgeInsets.symmetric(vertical: kInternalPadding),
            indicator: BubbleCircularIndicator(
                color: Colors.indigo.withOpacity(.1), radius: 18),
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.sticky_note_2_outlined)),
              Tab(icon: Icon(Icons.calendar_today_rounded)),
              Tab(icon: Icon(Icons.person_outline_rounded)),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            Icon(Icons.sticky_note_2_outlined),
            Icon(Icons.calendar_today_rounded),
            Icon(Icons.person_outline_rounded),
          ],
        ),
      ),
    );
  }
}
