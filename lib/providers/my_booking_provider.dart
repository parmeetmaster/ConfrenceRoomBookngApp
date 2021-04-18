import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/model/booking_model.dart';

class MyBookingProvider extends ChangeNotifier {
  List<BookingModel> mybookings;

  loadMyBookings() async {
    mybookings=[];
    QuerySnapshot snapshot =
        await FireBaseApi().getMyBookings(Global.activeCustomer);

    for (QueryDocumentSnapshot item in snapshot.docs) {
      BookingModel model = BookingModel.fromJson(item.data());
       mybookings.add(model);
      /*   item.data().forEach((key, value) {
        print(value);
      });*/
    }
    notifyListeners();

  }

  void performCancelBooking() {


  }
}
