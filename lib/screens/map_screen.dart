import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_am/utils/theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng? _currentPosition;

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Request permission again if denied
      _checkLocationPermission();
    } else if (permission == LocationPermission.deniedForever) {
      // Open app settings to grant permission
      Geolocator.openAppSettings();

      // Offer a way to open app settings for permission management
      // (Consider using a package like `permission_handler`)
    } else {
      _getLocation();
    }
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double lat = position.latitude;
      double long = position.longitude;

      setState(() {
        _currentPosition = LatLng(lat, long);
      });

      await _goToCurrentLocation();
    } on LocationServiceDisabledException catch (e) {
      // Handle location services disabled error
      Geolocator.openLocationSettings();
    }
  }

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 17.5,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: _currentPosition ?? LatLng(-6.1944, 106.8229),
            zoom: 17.5,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: _currentPosition ?? LatLng(-6.1944, 106.8229),
              infoWindow: const InfoWindow(
                title: 'Current Location',
                snippet: 'Lat : -6.1944 \nLong : 106.8229',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ),
          },
        ),
        Positioned(
          top: 10,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: CustomColors.lightColor,
            child: Text(
              'Lat : ${_currentPosition?.latitude} \nLong : ${_currentPosition?.longitude}',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: SafeArea(
            child: BackButton(
              color: CustomColors.lightColor,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  CustomColors.darkColor.withOpacity(0.8),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(14),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
