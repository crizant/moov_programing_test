import 'package:q2/models/person.dart';
import 'package:q2/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeopleNotifier extends AsyncNotifier<List<Person>> {
  @override
  Future<List<Person>> build() async {
    return ref.read(apiClientProvider).getPeople();
  }
}
