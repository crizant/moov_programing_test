import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:q2/service_locator.dart';
import 'person_tile.dart';

class PeopleList extends ConsumerWidget {
  const PeopleList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPeople = ref.watch(peopleProvider);
    if (asyncPeople.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final people = ref.watch(peopleProvider).value ?? [];
    return Scaffold(
      body: SafeArea(
        child: people.isNotEmpty
            ? ListView.builder(
                itemCount: people.length,
                itemBuilder: (BuildContext context, int index) {
                  final person = people[index];
                  return PersonTile(
                    person: person,
                    onTap: () {
                      context.go('/list/${person.id}');
                    },
                  );
                },
              )
            : const Center(
                child: Text('No Data'),
              ),
      ),
    );
  }
}
