// To parse this JSON data, do
//
//     final timeSlot = timeSlotFromJson(jsonString);

import 'dart:convert';

class TimeSlot {
  TimeSlot({
    this.bookingDate,
    this.bokingBinary,
  });

  DateTime bookingDate;
  String bokingBinary;

  factory TimeSlot.fromRawJson(String str) => TimeSlot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
    bookingDate: DateTime.parse(json["booking_date"]),
    bokingBinary: json["boking_binary"],
  );

  Map<String, dynamic> toJson() => {
    "booking_date": bookingDate.toIso8601String(),
    "boking_binary": bokingBinary,
  };
}

class TimeSlotResult {
  int status = 0;
  String msg;
  TimeSlot timeSlot;

  TimeSlotResult({this.status, this.msg, this.timeSlot});
}
