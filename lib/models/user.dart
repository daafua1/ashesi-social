// This file contains the AppUser class, which is used to store the user's information
class AppUser {
  String? name;
  String? dob;
  String? id;
  String? bestFood;
  String? bestMovie;
  bool? onCampus;
  String? major;
  String? year;
  String? email;
  String? profileImage;

  AppUser({
    this.name,
    this.dob,
    this.id,
    this.bestFood,
    this.bestMovie,
    this.onCampus,
    this.major,
    this.year,
    this.email,
    this.profileImage,
  });

// This method is used to convert the AppUser object to a JSON object
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      name: json['name'],
      dob: json['dob'],
      id: json['id'],
      bestFood: json['bestFood'],
      bestMovie: json['bestMovie'],
      onCampus: json['onCampus'],
      major: json['major'],
      year: json['year'],
      email: json['email'],
      profileImage: json['profileImage']
    );
  }

// This method is used to convert the JSON object to an AppUser object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dob': dob,
      'id': id,
      'bestFood': bestFood,
      'bestMovie': bestMovie,
      'onCampus': onCampus,
      'major': major,
      'year': year,
      'email': email,
      'profileImage': profileImage
    };
  }
}
