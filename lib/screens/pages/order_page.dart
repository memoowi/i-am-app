import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_am/utils/theme.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  static const CameraPosition _kLake = CameraPosition(
    // bearing: 192.8334901395799,
    target: LatLng(-6.1944, 106.8229),
    // tilt: 59.440717697143555,
    zoom: 17.5,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SafeArea(
          bottom: false,
          child: GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.hybrid,
            initialCameraPosition: _kLake,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: FloatingActionButton.extended(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
              ),
              backgroundColor: CustomColors.primaryColor,
              foregroundColor: CustomColors.lightColor,
              extendedTextStyle: CustomTextStyles.light.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              icon: Icon(
                CupertinoIcons.exclamationmark_triangle,
              ),
              label: Text('Emergency'),
            ),
          ),
        ),
      ],
    );
  }
}
