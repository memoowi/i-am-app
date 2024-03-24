part of 'ambulance_list_bloc.dart';

@immutable
sealed class AmbulanceListState {}

final class AmbulanceListInitial extends AmbulanceListState {}

final class AmbulanceListLoading extends AmbulanceListState {}

final class AmbulanceListLoaded extends AmbulanceListState {
  final AmbulanceListModel ambulances;
  AmbulanceListLoaded(this.ambulances);
}
