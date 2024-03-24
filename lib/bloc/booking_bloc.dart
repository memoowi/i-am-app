import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:i_am/utils/config.dart';
import 'package:i_am/utils/custom_snack_bar.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final dio = Dio();
  BookingBloc() : super(BookingInitial()) {
    on<CancelBookingEvent>((event, emit) async {
      emit(BookingLoading());

      try {
        final token = await getToken();
        final response =
            await dio.patch(Config.cancelBookingUrl + event.id.toString(),
                options: Options(headers: {
                  'Authorization': 'Bearer $token',
                }));

        if (response.statusCode == 200) {
          emit(BookingSuccess());
          if (event.context.mounted) {
            CustomSnackBar.show(
              message: 'Booking Cancelled',
              icon: Icons.check,
              context: event.context,
            );
          }
        }
      } on DioException catch (e) {
        emit(BookingFailed());
        if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
          if (event.context.mounted) {
            CustomSnackBar.show(
              message: e.response?.data['message'],
              icon: Icons.error,
              context: event.context,
            );
          }
        }
      } finally {
        emit(BookingInitial());
      }
    });

    on<NewBookingEvent>((event, emit) async {
      emit(BookingLoading());

      try {
        final token = await getToken();
        final response = await dio.post(Config.bookingListUrl,
            data: {
              'description': event.description,
              'latitude': event.latitude,
              'longitude': event.longitude,
            },
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));

        if (response.statusCode == 201) {
          emit(BookingSuccess());
          if (event.context.mounted) {
            CustomSnackBar.show(
              message: 'Booking Created',
              icon: Icons.check,
              context: event.context,
            );
          }
        }
      } on DioException catch (e) {
        emit(BookingFailed());
        if (event.context.mounted) {
          CustomSnackBar.show(
            message: e.response?.data['message'],
            icon: Icons.error,
            context: event.context,
          );
        }
      } finally {
        emit(BookingInitial());
      }
    });
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }
}
