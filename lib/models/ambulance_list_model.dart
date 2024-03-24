import 'package:i_am/models/booking_list_model.dart';

class AmbulanceListModel {
  String? status;
  String? message;
  List<Ambulance>? data;

  AmbulanceListModel({this.status, this.message, this.data});

  AmbulanceListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Ambulance>[];
      json['data'].forEach((v) {
        data!.add(new Ambulance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
