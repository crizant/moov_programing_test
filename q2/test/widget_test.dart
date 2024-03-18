import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:q2/models/person.dart';
import 'package:q2/screens/home/person_tile.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('PersonTile test', (WidgetTester tester) async {
    int mockCount = 0;
    final person = Person(
      id: '001',
      firstName: 'Tom',
      lastName: 'Chan',
      email: 'test@email.com',
      pictureUrl: 'https://placebear.com/225/210',
      location: (0, 0),
    );
    await tester.pumpWidget(
      Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PersonTile(
            person: person,
            onTap: () {
              mockCount++;
            },
          ),
        ),
      ),
    );

    expect(find.text('Tom Chan'), findsOneWidget);
    expect(find.text('test@email.com'), findsOneWidget);

    await tester.tap(find.byType(PersonTile));
    await tester.pumpAndSettle();

    expect(mockCount, 1);
  });
}
