//

class UserModel {
  final String firstName;
  final String lastName;
  final int age;
  final String dob;
  final String imageMedium;
  final String imageLarge;
  final String city;
  final String country;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.dob,
    required this.imageMedium,
    required this.imageLarge,
    required this.city,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      age: json['dob']['age'],
      dob: json['dob']['date'],
      imageMedium: json['picture']['medium'],
      imageLarge: json['picture']['large'],
      city: json['location']['city'],
      country: json['location']['country'],
    );
  }
}
