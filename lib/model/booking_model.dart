// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

class BookingModel {
  BookingModel({
    this.bookingDate,
    this.bookingStartTime,
    this.bookingStartduration,
    this.bookingEndTime,
    this.bookingEndduration,
    this.bookingId,
    this.bookingUserId,
    this.bookingStatus,
  });

  String bookingDate;
  DateTime bookingStartTime;
  double bookingStartduration;
  DateTime bookingEndTime;
  double bookingEndduration;
  String bookingId;
  String bookingUserId;
  bool bookingStatus;

  factory BookingModel.fromRawJson(String str) => BookingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    bookingDate: json["bookingDate"],
    bookingStartTime: DateTime.parse(json["bookingStartTime"]),
    bookingStartduration: json["bookingStartduration"].toDouble(),
    bookingEndTime: DateTime.parse(json["bookingEndTime"]),
    bookingEndduration: json["bookingEndduration"].toDouble(),
    bookingId: json["bookingId"],
    bookingUserId: json["bookingUserId"],
    bookingStatus: json["bookingStatus"],
  );

  Map<String, dynamic> toJson() => {
    "bookingDate": bookingDate,
    "bookingStartTime": bookingStartTime.toIso8601String(),
    "bookingStartduration": bookingStartduration,
    "bookingEndTime": bookingEndTime.toIso8601String(),
    "bookingEndduration": bookingEndduration,
    "bookingId": bookingId,
    "bookingUserId": bookingUserId,
    "bookingStatus": bookingStatus,
  };
}
