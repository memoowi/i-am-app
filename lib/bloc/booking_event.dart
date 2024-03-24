part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class NewBookingEvent extends BookingEvent {
  final BuildContext context;
  final String description;
  final double latitude;
  final double longitude;

  NewBookingEvent({
    required this.context,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}

class CancelBookingEvent extends BookingEvent {
  final BuildContext context;
  final int id;

  CancelBookingEvent({
    required this.context,
    required this.id,
  });
}
