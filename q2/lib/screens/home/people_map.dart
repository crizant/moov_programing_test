import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:q2/constants.dart';
import 'package:q2/models/person.dart';
import 'package:q2/service_locator.dart';

class PeopleMap extends ConsumerStatefulWidget {
  const PeopleMap({super.key});

  @override
  ConsumerState<PeopleMap> createState() => _PeopleMapState();
}

class _PeopleMapState extends ConsumerState<PeopleMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  void _handlePeopleChange(
    AsyncValue<List<Person>>? oldValue,
    AsyncValue<List<Person>>? newValue,
  ) async {
    // udpate camera position if value changes from empty to not empty
    if (oldValue?.hasValue == false && newValue?.value?.isNotEmpty == true) {
      final firstPersonLocation = newValue!.value!.first.location;
      (await _controller.future).animateCamera(
        CameraUpdate.newLatLng(
          LatLng(firstPersonLocation.$1, firstPersonLocation.$2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(peopleProvider, _handlePeopleChange);

    final people = ref.watch(peopleProvider).value ?? [];

    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: people.isNotEmpty
              ? LatLng(people.first.location.$1, people.first.location.$2)
              : defaultLocation,
          zoom: 10.0,
        ),
        markers: people
            .map(
              (person) => Marker(
                markerId: MarkerId(person.id),
                position: LatLng(person.location.$1, person.location.$2),
                infoWindow: InfoWindow(
                  title: person.fullName,
                ),
              ),
            )
            .toSet(),
      ),
    );
  }
}
