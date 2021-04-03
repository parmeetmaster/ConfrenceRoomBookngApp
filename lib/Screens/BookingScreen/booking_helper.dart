import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/model/booking_model.dart';
import 'package:uuid/uuid.dart';







class BookingHelper {
  getBookings(DateTime date) async {
    QuerySnapshot snapshot = await FireBaseApi().getSelectedDateBookings(
        model: BookingModel(bookingDate: getFirebaseFormatDate(date)));
    return snapshot;
  }

 checkIsBookingExist(
      {TimeOfDay endTime, TimeOfDay startTime, DateTime date}) async {
    print("we called");
    int cuuruntMeetingStartInDuration =
        Duration(hours: startTime.hour, minutes: startTime.minute).inSeconds;
    int cuuruntMeetingEndInDuration =
        Duration(hours: endTime.hour, minutes: endTime.minute).inSeconds;
    QuerySnapshot snapshot = await getBookings(date);
    for (QueryDocumentSnapshot item in snapshot.docs) {
      BookingModel model = BookingModel.fromJson(item.data());
      if (model.bookingStartduration < cuuruntMeetingStartInDuration &&
          cuuruntMeetingStartInDuration < model.bookingEndduration) {
    /*
    booking start duration is 47000
    selected start duration is 48000
    booking end duration 51000
    selected end duration 540000
    470000<480000 &&  480000<510000
    */
    print("clash of start time");
      }else  if (model.bookingStartduration < cuuruntMeetingEndInDuration &&
          cuuruntMeetingEndInDuration < model.bookingEndduration) {
        /*
    booking start duration is 47000
     booking end duration 60000
    selected start duration is 48000
    selected end duration 540000
    470000<540000 &&  540000<60000
    */
        print("clash of end time");
      }

    }
  }

  addBooking({TimeOfDay endTime, TimeOfDay startTime, DateTime date})async {
    await checkIsBookingExist(endTime: endTime, startTime: startTime, date: date);

    var uuid = Uuid();
    FireBaseApi().addBookingEntery(
        model: BookingModel(
      bookingDate: getFirebaseFormatDate(date),
      bookingStartTime: getDatewithTime(date, startTime),
      bookingEndTime: getDatewithTime(date, endTime),
      bookingStartduration:
          Duration(hours: startTime.hour, minutes: startTime.minute).inSeconds,
      bookingEndduration:
          Duration(hours: endTime.hour, minutes: endTime.minute).inSeconds,
      bookingUserId: uuid.v4(),
      bookingId: uuid.v4(),
      bookingStatus: false,
    ));
  }

  void convertSecondsToTime(int seconds) {
    Duration duration = Duration(seconds: seconds);

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    print("${duration.inHours} mins ${twoDigitMinutes} ");
  }
}
