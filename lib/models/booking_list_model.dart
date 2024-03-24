class BookingListModel {
  String? status;
  String? message;
  List<BookingData>? data;

  BookingListModel({this.status, this.message, this.data});

  BookingListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BookingData>[];
      json['data'].forEach((v) {
        data!.add(BookingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingData {
  int? id;
  int? userId;
  int? ambulanceId;
  String? description;
  double? latitude;
  double? longitude;
  DateTime? bookingTime;
  DateTime? arrivalTime;
  DateTime? completionTime;
  String? status;
  String? createdAt;
  String? updatedAt;
  Ambulance? ambulance;

  BookingData(
      {this.id,
      this.userId,
      this.ambulanceId,
      this.description,
      this.latitude,
      this.longitude,
      this.bookingTime,
      this.arrivalTime,
      this.completionTime,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.ambulance});

  BookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    ambulanceId = json['ambulance_id'];
    description = json['description'];
    latitude = double.parse(json['latitude']);
    longitude = double.parse(json['longitude']);
    bookingTime = DateTime.parse(json['booking_time']);
    arrivalTime = json['arrival_time'] != null
        ? DateTime.parse(json['arrival_time'])
        : null;
    completionTime = json['completion_time'] != null
        ? DateTime.parse(json['completion_time'])
        : null;
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ambulance = json['ambulance'] != null
        ? Ambulance.fromJson(json['ambulance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ambulance_id'] = this.ambulanceId;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['booking_time'] = this.bookingTime;
    data['arrival_time'] = this.arrivalTime;
    data['completion_time'] = this.completionTime;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.ambulance != null) {
      data['ambulance'] = this.ambulance!.toJson();
    }
    return data;
  }
}

class Ambulance {
  int? id;
  int? userId;
  String? licensePlate;
  String? model;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;
  User? user;

  Ambulance(
      {this.id,
      this.userId,
      this.licensePlate,
      this.model,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt,
      this.user});

  Ambulance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    licensePlate = json['license_plate'];
    model = json['model'];
    latitude = double.parse(json['latitude']);
    longitude = double.parse(json['longitude']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['license_plate'] = this.licensePlate;
    data['model'] = this.model;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
