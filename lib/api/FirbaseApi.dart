import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kkconferences/global/Global.dart';
import 'package:kkconferences/model/TimeSlots.dart';
import 'package:kkconferences/model/customer.dart';
import 'package:uuid/uuid.dart';

class FireBaseApi {
  getSampleCustomer() {
    var uuid = Uuid();
    return Customer(
        customerId: uuid.v4(),
        customerName: "data",
        email: "abc@gmail.com",
        password: "1236547899",
        phno: "98191855655",
        created_at: DateTime.now());
  }

  createCustomer(Customer customer) async {
    bool user_flag = await checkUserExist(customer);
    if (user_flag == true) {
      return CustomerResult(status: 0, msg: "User Already Exist");
    }

    var uuid = Uuid();
    customer.customerId = uuid.v4();
    FirebaseFirestore.instance
        .collection("Customers")
        .add(customer.toJson())
        .then((value) {});
    return CustomerResult(status: 1, msg: "User Created successfully");
  }

/*  getByDate(){
    FirebaseFirestore.instance.collection("Customers")
        .where("date", isLessThanOrEqualTo: DateTime.now().toIso8601String())
        .get().then((value) {
      value.docs.forEach((result) {
        print("data is here ${result.data()}");
      });

    });

  }*/

  Future<QuerySnapshot> getCustomer(Customer customer) async {
    return await FirebaseFirestore.instance
        .collection("Customers")
        .where("email", isEqualTo: customer.email)
        .get()
        .then((value) {
      return value;
    });
  }

  Future<bool> checkUserExist(Customer customer) async {
    var snapshot = await getCustomer(customer);
    print("size of data is : ${snapshot.size}");

    if (snapshot != null) {
      if (snapshot.size > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return null;
    }
  }

  signIn(Customer customer) async {
    QuerySnapshot snapshot = await getCustomer(customer);
    try {
      QueryDocumentSnapshot result = snapshot.docs.first;
      if (result.exists) {
        if(customer.password==result.get("password") && customer.email==result.get("email")){
          return CustomerResult(status: 1,msg: "Login Successfull",customer: Customer.fromJson(result.data()));
        }else{
          return    CustomerResult(status: 0,msg: "User not found");
        }
      }
    } catch (e) {
      return CustomerResult(status: 0,msg: "User not found");

    }
  }

  /*----------------------------------Time Slot Enteries----------------------------------------------------*/
  addTimeSlotEntry({TimeSlot timeSlot}) async {
    bool user_flag_slot = await checkTimeSlotExist(timeSlot);
    if (user_flag_slot == true) {
      return CustomerResult(status: 0, msg: "User Already Exist");
    }
    FirebaseFirestore.instance
        .collection("TimeSlot")
        .add(timeSlot.toJson())
        .then((value) {});
    return TimeSlotResult(status: 1, msg: "Slot Created successfully");
  }

  Future<bool> checkTimeSlotExist(TimeSlot timeSlot) async {
    var snapshot = await getTimeSlot(timeSlot);
    print("size of data is : ${snapshot.size}");
    if (snapshot != null) {
      if (snapshot.size > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return null;
    }
  }

  Future<QuerySnapshot> getTimeSlot(TimeSlot timeSlot) async {
    return await FirebaseFirestore.instance
        .collection("TimeSlot")
        .where("email", isEqualTo:timeSlot.bookingDate)
        .get()
        .then((value) {
      return value;
    });
  }
}
