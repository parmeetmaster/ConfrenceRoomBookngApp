// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.customerId,
    this.customerName,
    this.phno,
    this.email,
    this.password,
    this.date,
  });

  String customerId;
  String customerName;
  String phno;
  String email;
  String password;
  DateTime date;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    customerName: json["customer_name"],
    phno: json["phno"],
    email: json["email"],
    password: json["password"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "customer_name": customerName,
    "phno": phno,
    "email": email,
    "password": password,
    "date": date.toIso8601String(),
  };
}
