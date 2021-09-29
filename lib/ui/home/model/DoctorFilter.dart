class DoctorFilter {
  String? id;
  String? image;
  String? name;

  DoctorFilter({this.id, this.image, this.name});

  factory DoctorFilter.fromJson(Map<String, dynamic> json) {
    return DoctorFilter(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
