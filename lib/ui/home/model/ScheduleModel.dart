import 'package:demo_doctor/ui/home/model/Schedule.dart';

class ScheduleModel {
  List<Schedule>? schedule;

  ScheduleModel({this.schedule = const []});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      schedule: json['schedules'] != null
          ? (json['schedules'] as List)
              .map((i) => Schedule.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedule != null) {
      data['channelsOrGroup'] = this.schedule?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
