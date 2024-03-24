import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_am/bloc/ambulance_list_bloc.dart';
import 'package:i_am/bloc/location_bloc.dart';
import 'package:i_am/models/booking_list_model.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/custom_modal_popup.dart';

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
        ),
        icon: BitmapDescriptor.defaultMarker,
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
