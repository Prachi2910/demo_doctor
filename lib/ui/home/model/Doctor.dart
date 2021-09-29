class Doctor {
  String? profession;
  String? id;
  String? image;
  String? name;
  double? rating;
  int? reviews;

  Doctor(
      {this.profession,
      this.id,
      this.image,
      this.name,
      this.rating,
      this.reviews});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      profession: json['profession'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      rating: json['rating'],
      reviews: json['reviews'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profession'] = this.profession;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    return data;
  }
}
