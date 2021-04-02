import 'package:flutter/material.dart';
import 'package:kkconferences/global/constants.dart';
import 'package:kkconferences/providers/booking_screen_provider.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  static const classname = "/BookingScreen";

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Room"),
        backgroundColor: main_color,
      ),
      body: Consumer<BookingScreenProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      DateTime date = DateTime.now();
                      FocusScope.of(context).requestFocus(new FocusNode());

                      DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year,DateTime.now().month,1),
                        lastDate: DateTime(DateTime.now().year,DateTime.now().month+1,31),
                      );
                      if (picked != null && picked != date) {
                        // add this line.
                        value.setDate(picked);
                      }
                    },
                    child: AbsorbPointer(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40,
                        child: TextField(
                          controller: value.curruntDateController,
                          autocorrect: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            hintText: 'Date',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.black54,
                            ),
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      TimeOfDay time = TimeOfDay.now();
                      FocusScope.of(context).requestFocus(new FocusNode());
                      TimeOfDay picked = await showTimePicker(
                          context: context, initialTime: time);
                      if (picked != null && picked != time) {
                        // add this line.
                        setState(() {
                          time = picked;
                        });
                      }
                    },
                    child: InkWell(
                        onTap: () async {
                            TimeOfDay time = TimeOfDay.now();
                            FocusScope.of(context).requestFocus(new FocusNode());

                              TimeOfDay picked = await showTimePicker(
                                   context: context, initialTime: time);
                              if (picked != null && picked != time) {
        // start date
                             Duration duration=Duration(seconds: 48092);

                             String twoDigits(int n) => n.toString().padLeft(2, "0");
                             String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
                             String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
                            // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
                                print("${duration.inHours} mins ${twoDigitMinutes} ");
                                       }
                                          },
                      child: AbsorbPointer(
                        child: Container(
                          width: 150,
                          height: 40,
                          child: TextField(
                            autocorrect: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Start Time',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.watch_later_outlined,
                                color: Colors.black54,
                              ),
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.black38, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black54, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      TimeOfDay time = TimeOfDay.now();
                      FocusScope.of(context).requestFocus(new FocusNode());

                      TimeOfDay picked = await showTimePicker(
                          context: context, initialTime: time);
                      if (picked != null && picked != time) {
                        // add this line.
                        setState(() {
                          time = picked;
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: Container(
                        width: 150,
                        height: 40,
                        child: TextField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            hintText: 'End Time',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.watch_later_outlined,
                              color: Colors.black54,
                            ),
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),


/*          TextFormField(
           // add this line.
              decoration: InputDecoration(
                labelText: 'time*',
              ),
              onTap: () async {
                TimeOfDay time = TimeOfDay.now();
                FocusScope.of(context).requestFocus(new FocusNode());

                TimeOfDay picked =
                await showTimePicker(context: context, initialTime: time);
                if (picked != null && picked != time) {
             // add this line.
                  setState(() {
                    time = picked;
                  });
                }
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'cant be empty';
                }
                return null;
              },
            ),*/
            ],
          ),
        );
      }),
    );
  }
}
