part of 'booking_list_bloc.dart';

@immutable
sealed class BookingListState {}

final class BookingListInitial extends BookingListState {}

final class BookingListLoading extends BookingListState {}

final class BookingListLoaded extends BookingListState {
  final BookingListModel bookingList;

  BookingListLoaded({required this.bookingList});
}

final class BookingListError extends BookingListState {
  final String message;

  BookingListError({required this.message});
}
