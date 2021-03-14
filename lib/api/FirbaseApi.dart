import 'package:cloud_firestore/cloud_firestore.dart';
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
        date: DateTime.now());
  }

  createCustomer(Customer customer) async {
    var uuid = Uuid();
    customer.customerId = uuid.v4();
    FirebaseFirestore.instance
        .collection("Customers")
        .add(customer.toJson())
        .then((value) {});
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

  getCustomer(Customer customer) async {
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
      }else{
        return false;
      }
    }else{
      return null;
    }

    /* snapshot.docs.forEach((result) {
     print("data is here ${result.data()}");
   }
   );
*/
  }
}
