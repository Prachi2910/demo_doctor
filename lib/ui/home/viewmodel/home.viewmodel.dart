// Flutter imports:
import 'dart:convert';

import 'package:demo_doctor/constant/drawable.constants.dart';
import 'package:demo_doctor/support/tinder_card.widget.dart';
import 'package:demo_doctor/ui/home/model/DoctorFilter.dart';
import 'package:demo_doctor/ui/home/model/DoctosModel.dart';
import 'package:demo_doctor/ui/home/model/ScheduleModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeViewModel extends ChangeNotifier {
  final searchTextController = TextEditingController();

  final searchFormFieldKey = GlobalKey<FormFieldState>();

  final searchFocusNode = FocusNode();

  String get search => searchTextController.text;

  CardController tinderController = CardController();

  List<DoctorFilter> doctorFilter = [
    DoctorFilter(name: "Heart Surgeon", image: icn_heart),
    DoctorFilter(image: icn_pill, name: "Psychologist"),
    DoctorFilter(image: icn_teeth, name: "Dentist")
  ];

  int selectedFilter = 0;

  HomeViewModel() {
    searchTextController.addListener(textControllerListener);
  }

  void textControllerListener() {
    notifyListeners();
  }

  void setFilter(int index) {
    selectedFilter = index;
    notifyListeners();
  }

  Future<ScheduleModel> getData() async {
    final String response =
        await rootBundle.loadString('assets/jsons/schedule_data.json');
    final data = await json.decode(response);
    return ScheduleModel.fromJson(data);
  }

  Future<DoctorsModel> getDoctorsData() async {
    final String response =
        await rootBundle.loadString('assets/jsons/doctor_data.json');
    final data = await json.decode(response);
    return DoctorsModel.fromJson(data);
  }
}
