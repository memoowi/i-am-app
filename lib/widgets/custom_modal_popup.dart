import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am/bloc/booking_bloc.dart';
import 'package:i_am/bloc/location_bloc.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/custom_filled_button.dart';
import 'package:i_am/widgets/custom_form_field.dart';
import 'package:intl/intl.dart';

class CustomModalPopup extends StatefulWidget {
  const CustomModalPopup({
    super.key,
  });

  @override
  State<CustomModalPopup> createState() => _CustomModalPopupState();
}

class _CustomModalPopupState extends State<CustomModalPopup> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController bookingTimeController = TextEditingController();

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 4) {
      return 'Description must be at least 4 characters';
    }
    return null;
  }

  String? validateBookingTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  void initState() {
    bookingTimeController.text =
        DateFormat('EEE, dd MMM yyyy (h:mm a)').format(DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    bookingTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Get Ambulance',
                style: CustomTextStyles.secondaryMadimi.copyWith(
                  fontSize: 24.0,
                  decoration: TextDecoration.none,
                ),
              ),
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoaded) {
                    return Text(
                      'Lat : ${state.latLng.latitude} \t Long : ${state.latLng.longitude}',
                      style: CustomTextStyles.greyMadimi.copyWith(
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                      ),
                    );
                  }
                  return Container();
                },
              ),
              Divider(
                color: CustomColors.secondaryColor,
                thickness: 2.0,
              ),
              SizedBox(height: 20.0),
              CustomFormField(
                controller: descriptionController,
                labelText: 'Description',
                validator: validateDescription,
                prefixIcon: CupertinoIcons.info_circle,
              ),
              SizedBox(height: 20.0),
              CustomFormField(
                controller: bookingTimeController,
                labelText: 'Booking Time',
                validator: validateBookingTime,
                prefixIcon: CupertinoIcons.time,
                readOnly: true,
              ),
              Spacer(),
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoaded) {
                    final latitude = state.latLng.latitude;
                    final longitude = state.latLng.longitude;
                    return BlocConsumer<BookingBloc, BookingState>(
                      listener: (context, state) {
                        if (state is BookingSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (route) => false,
                            arguments: 1,
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomFilledButton(
                          text: 'Get Ambulance',
                          onPressed: (state is BookingLoading)
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<BookingBloc>()
                                        .add(NewBookingEvent(
                                          context: context,
                                          description:
                                              descriptionController.text,
                                          latitude: latitude,
                                          longitude: longitude,
                                        ));
                                  }
                                },
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
