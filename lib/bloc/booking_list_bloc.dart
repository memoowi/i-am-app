import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:i_am/models/booking_list_model.dart';
import 'package:i_am/utils/config.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'booking_list_event.dart';
part 'booking_list_state.dart';

class BookingListBloc extends Bloc<BookingListEvent, BookingListState> {
  final dio = Dio();
  BookingListBloc() : super(BookingListInitial()) {
    on<FetchBookingList>((event, emit) async {
      emit(BookingListLoading());

      try {
        final token = await getToken();
        final response = await dio.get(Config.bookingListUrl,
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));

        final bookingList = BookingListModel.fromJson(response.data);
        emit(BookingListLoaded(bookingList: bookingList));
      } on DioException catch (e) {
        log(e.toString());
        emit(BookingListError(
          message: e.response!.data['message'],
        ));
      }
    });
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }
}
