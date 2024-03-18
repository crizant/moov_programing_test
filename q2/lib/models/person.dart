class Person {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String pictureUrl;
  final (double, double) location;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.pictureUrl,
    required this.location,
  });

  String get fullName => '$firstName $lastName';

  static Person? fromJson(Map<String, dynamic> json) {
    if (json
        case {
          '_id': String id,
          'name': {'first': String firstName, 'last': String lastName},
          'email': String email,
          'picture': String pictureUrl,
          'location': {
            'latitude': double latitude,
            'longitude': double longitude,
          },
        }) {
      return Person(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        pictureUrl: pictureUrl,
        location: (latitude, longitude),
      );
    }
    return null;
  }
}
