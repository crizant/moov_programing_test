import 'package:flutter_test/flutter_test.dart';
import 'package:q2/models/person.dart';

void main() {
  test('Person.fromJson', () {
    final json = {
      "_id": "ae736d8f-5a08-4bab-8e30-1eb2079e5dc2",
      "name": {"last": "Bass", "first": "Bradley"},
      "email": "aida.griffith@sybixtex.show",
      "picture": "https://placebear.com/225/210",
      "location": {"latitude": 22.38, "longitude": 11.2},
    };
    final person = Person.fromJson(json);
    expect(person?.id, json['_id']);
    expect(person?.firstName, (json['name'] as Map)['first']);
    expect(person?.lastName, (json['name'] as Map)['last']);
    expect(person?.email, json['email']);
    expect(person?.pictureUrl, json['picture']);
    expect(person?.location, (
      (json['location'] as Map)['latitude'],
      (json['location'] as Map)['longitude'],
    ));
  });

  test('Person.fullName', () {
    final json = {
      "_id": "ae736d8f-5a08-4bab-8e30-1eb2079e5dc2",
      "name": {"last": "Bass", "first": "Bradley"},
      "email": "aida.griffith@sybixtex.show",
      "picture": "https://placebear.com/225/210",
      "location": {"latitude": 22.38, "longitude": 11.2},
    };
    final person = Person.fromJson(json);
    expect(person?.fullName, 'Bradley Bass');
  });

  test('Invalid json format', () {
    final json = {
      "_id": "ae736d8f-5a08-4bab-8e30-1eb2079e5dc2",
      "name": {"last": "Bass", "first": "Bradley"},
    };
    final person = Person.fromJson(json);
    expect(person, null);
  });
}
