class Config {
  static const String baseApiUrl = "http://10.0.2.2:8000/api";

  // Auth
  static const String registerUrl = "$baseApiUrl/register";
  static const String loginUrl = "$baseApiUrl/login";
  static const String logoutUrl = "$baseApiUrl/logout";
  static const String userUrl = "$baseApiUrl/user";

  // Bookings
  static const String bookingListUrl = "$baseApiUrl/bookings";
  static const String cancelBookingUrl = "$baseApiUrl/bookings/";

  // Ambulances
  static const String ambulanceUrl = "$baseApiUrl/ambulances";
}
