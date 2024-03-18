import 'package:q2/api.dart';
import 'package:q2/data/people_notifier.dart';
import 'package:q2/models/person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final peopleProvider = AsyncNotifierProvider<PeopleNotifier, List<Person>>(
  PeopleNotifier.new,
);
