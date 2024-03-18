import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:q2/constants.dart';
import 'package:q2/screens/home/person_tile.dart';
import 'package:q2/service_locator.dart';

class DetailScreen extends ConsumerWidget {
  final String id;
  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(peopleProvider).value?.firstWhereOrNull(
          (people) => people.id == id,
        );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: person != null
                      ? LatLng(person.location.$1, person.location.$2)
                      : defaultLocation,
                  zoom: 15.0,
                ),
                markers: {
                  if (person != null) ...{
                    Marker(
                      markerId: MarkerId(person.id),
                      position: LatLng(person.location.$1, person.location.$2),
                    )
                  },
                },
              ),
            ),
            if (person != null) ...[
              PersonTile(person: person),
            ],
          ],
        ),
      ),
    );
  }
}
