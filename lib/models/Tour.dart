// ignore_for_file: file_names

class Tour {
  String country;
  String city;
  String hotel;
  String img;

  Tour({
    required this.country,
    required this.city,
    required this.hotel,
    required this.img,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      country: json['country'],
      city: json['city'],
      hotel: json['hotel'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'city': city,
      'hotel': hotel,
      'img': img,
    };
  }
}
