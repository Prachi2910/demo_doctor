import 'Doctor.dart';

class DoctorsModel {
  List<Doctor>? doctors;

  DoctorsModel({this.doctors});

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      doctors: json['doctors'] != null
          ? (json['doctors'] as List).map((i) => Doctor.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['doctors'] = this.doctors?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
