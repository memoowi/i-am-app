import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_am/bloc/ambulance_list_bloc.dart';
import 'package:i_am/bloc/location_bloc.dart';
import 'package:i_am/models/booking_list_model.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/custom_filled_button.dart';
import 'package:i_am/widgets/custom_modal_popup.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<Marker> markers(List<Ambulance> ambulances) {
    return ambulances.fold<Set<Marker>>({}, (markers, ambulance) {
      // Assuming 'latitude' and 'longitude' are properties of 'Data' class
      final marker = Marker(
        markerId: MarkerId(ambulance.id.toString()),
        position: LatLng(ambulance.latitude!, ambulance.longitude!),
        infoWindow: InfoWindow(
            title: 'Driver Name : ${ambulance.user!.name}',
            snippet:
                'Lat : ${ambulance.latitude} \nLong : ${ambulance.longitude}',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                showDragHandle: true,
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                builder: (context) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Ambulance Details',
                          style: CustomTextStyles.darkMadimi.copyWith(
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Driver Name : ${ambulance.user!.name!.toUpperCase()}',
                        style: CustomTextStyles.dark.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Lat : ${ambulance.latitude}',
                        style: CustomTextStyles.dark.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Long : ${ambulance.longitude}',
                        style: CustomTextStyles.dark.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Model : ${ambulance.model}',
                        style: CustomTextStyles.dark.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'License Plate : ${ambulance.licensePlate}',
                        style: CustomTextStyles.dark.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Contact : ${ambulance.user!.phoneNumber}',
                        style: CustomTextStyles.dark.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      CustomFilledButton(
                        text: 'Contact',
                        onPressed: () async {
                          final phoneNumber = ambulance.user!.phoneNumber;
                          final url = 'https://wa.me/$phoneNumber';
                          await launchUrl(Uri.parse(url));
                        },
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              );
            }),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      );
      markers.add(marker);
      return markers;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<AmbulanceListBloc>().add(FetchAmbulances());
    context.read<LocationBloc>().add(GetLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Stack(
        children: [
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state is LocationLoaded) {
                context.read<LocationBloc>().add(GoToCurrentLocation(
                    latLng: state.latLng, controller: _controller));
              }
            },
            child: BlocBuilder<AmbulanceListBloc, AmbulanceListState>(
              builder: (context, state) {
                if (state is AmbulanceListLoaded) {
                  return GoogleMap(
                    myLocationEnabled: true,
                    mapType: MapType.hybrid,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(-6.1944, 106.8229),
                      zoom: 17.5,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: markers(state.ambulances.data!),
                  );
                } else {
                  return Container(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationLoaded) {
                return Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: CustomColors.lightColor,
                    child: Text(
                      'Lat : ${state.latLng.latitude} \nLong : ${state.latLng.longitude}',
                      style: CustomTextStyles.darkMadimi.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 64.0),
              child: TextButton.icon(
                onPressed: () {
                  context.read<LocationBloc>().add(GetLocation());
                  showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      builder: (context) {
                        return CustomModalPopup();
                      });
                },
                icon: Icon(Icons.my_location),
                label: Text('Get Ambulance'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    CustomColors.primaryColor,
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    CustomColors.lightColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
