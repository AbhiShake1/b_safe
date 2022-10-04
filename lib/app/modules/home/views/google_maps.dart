import 'dart:async';

import 'package:b_safe/app/utils/permission.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMapsView extends StatelessWidget {
  const AppMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: context.width * .9,
          height: context.height * .5,
          child: PhysicalModel(
            color: Colors.grey,
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const AppGoogleMaps(),
            ),
          ),
        ).paddingAll(20),
        ...List.generate(30, (index) => const Text('data')),
      ],
    );
  }
}

class AppGoogleMaps extends StatelessWidget {
  const AppGoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AppPermission.locationPermissionGranted,
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data!) {
          return const SizedBox.shrink();
        }

        final _controller = Completer<GoogleMapController>();

        return GoogleMap(
          gestureRecognizers: const {Factory(EagerGestureRecognizer.new)},
          initialCameraPosition: const CameraPosition(
            target: LatLng(2, 3),
          ),
          onMapCreated: (controller) async {
            _controller.complete(controller);
            final pos = await Geolocator.getCurrentPosition();
            await controller.moveCamera(
              CameraUpdate.newLatLng(LatLng(pos.latitude, pos.longitude)),
            );
          },
          // mapType: MapType.hybrid,
          onCameraMove: (pos) async {
            final ctrl = await _controller.future;
            unawaited(
              ctrl.animateCamera(
                CameraUpdate.newCameraPosition(pos),
              ),
            );
          },
          indoorViewEnabled: true,
          minMaxZoomPreference: const MinMaxZoomPreference(16, 22),
          trafficEnabled: true,
          mapToolbarEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
        );
      },
    );
  }
}
