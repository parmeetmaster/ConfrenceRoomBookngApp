import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/model/booking_model.dart';

class BookingHelper {
  getBookings(DateTime date) async {
    QuerySnapshot snapshot = await FireBaseApi().getSelectedDateBookings(
        model: BookingModel(bookingDate: getFirebaseFormatDate(date)));
    return snapshot;
  }

  checkIsBookingExist(
      {DateTime date, TimeOfDay startTime, TimeOfDay endTime}) async {
    print("we called");

    QuerySnapshot snapshot = await getBookings(date);
    for (QueryDocumentSnapshot item in snapshot.docs) {
      BookingModel model = BookingModel.fromJson(item.data());

      // its used to check whether new meeting and currunt meeting under same hour span.

/*
      // miscellious operation while start date and booking date hour same
      if (endTime.hour == model.bookingStartTime.hour) {
        if (endTime.minute > model.bookingStartTime.minute) {
          // todo yes meeting possible
        } else if (endTime.minute < model.bookingStartTime.minute) {
          // todo no meeting possible
        }
      }

      // miscellious operation while start date and booking date hour same
      if(startTime.hour == model.bookingEndTime.hour)

*/



      // start date operation
      for (int i = model.bookingStartTime.hour;
          i >= model.bookingEndTime.hour;
          i++) {
        if (i == startTime.hour || i == endTime.hour) {
         print("time clash");
        }
      }



    }
  }
}
