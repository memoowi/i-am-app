import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:i_am/models/ambulance_list_model.dart';
import 'package:i_am/utils/config.dart';
import 'package:meta/meta.dart';

part 'ambulance_list_event.dart';
part 'ambulance_list_state.dart';

class AmbulanceListBloc extends Bloc<AmbulanceListEvent, AmbulanceListState> {
  final dio = Dio();
  AmbulanceListBloc() : super(AmbulanceListInitial()) {
    on<FetchAmbulances>((event, emit) async {
      emit(AmbulanceListLoading());

      try {
        final response = await dio.get(Config.ambulanceUrl);
        if (response.statusCode == 200) {
          AmbulanceListModel ambulances =
              AmbulanceListModel.fromJson(response.data);
          emit(AmbulanceListLoaded(ambulances));
        }
      } on DioException catch (e) {
        log(e.toString());
        emit(AmbulanceListInitial());
      }
    });
  }
}
