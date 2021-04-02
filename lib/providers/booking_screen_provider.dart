import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/model/TimeSlots.dart';
import 'package:kkconferences/widgets/chip.dart';

enum bookstatus { startdate, enddate }

class BookingScreenProvider extends ChangeNotifier {
  dynamic activeStatus;

  TextEditingController curruntDateController = new TextEditingController();

  DateTime meeting_date;

  setDate(DateTime date) {
    this.meeting_date = date;

    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    curruntDateController.text = formatter.format(date);

    /*    FireBaseApi().addTimeSlotEntry(timeSlot: TimeSlot(
        bookingDate: date, bokingBinary: "00100010111110101"));*/
  }





}
