class Schedule {
  String? date;
  String? id;
  String? image;
  String? name;
  String? profession;

  Schedule({this.date, this.id, this.image, this.name, this.profession});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      date: json['date'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      profession: json['profession'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['profession'] = this.profession;
    return data;
  }
}
