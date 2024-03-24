part of 'ambulance_list_bloc.dart';

@immutable
sealed class AmbulanceListEvent {}

class FetchAmbulances extends AmbulanceListEvent {}
