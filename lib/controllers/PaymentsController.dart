import 'package:logger/logger.dart';
import 'package:get/get.dart';
import 'package:sepurane_kasir/controllers/CartController.dart';
import 'package:sepurane_kasir/controllers/UserController.dart';
import 'package:sepurane_kasir/screens/RiwayatTransaksi.dart';
import 'package:sepurane_kasir/services/firebase.dart';
import 'package:sepurane_kasir/model/PaymentsModel.dart';
import 'package:uuid/uuid.dart';

class PaymentsController extends GetxController {
  Logger logger = Logger();
  CartController cartController = CartController.instance;
  UserController userController = UserController.instance;
  static PaymentsController instance = Get.find();
  String collection = "payments";
  List<PaymentsModel> payments = [];

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> createPaymentMethod() async {
    processPaymentAsDirectCharge();
  }

  Future<void> processPaymentAsDirectCharge() async {
    _addToCollection();
  }

  _addToCollection() {
    String id = Uuid().v1();
    firebaseFirestore.collection(collection).doc(id).set({
      "id": id,
      "clientId": userController.userModel.value.id,
      "cart": userController.userModel.value.cartItemsToJson(),
      "amount": cartController.totalCartPrice.value.toStringAsFixed(2),
      "createdAt": DateTime.now().microsecondsSinceEpoch,
    });
  }

  getPaymentHistory() {
    payments.clear();
    firebaseFirestore
        .collection(collection)
        .where("clientId", isEqualTo: userController.userModel.value.id)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((doc) {
        PaymentsModel payment = PaymentsModel.fromMap(doc.data());
        payments.add(payment);
      });

      logger.i("length ${payments.length}");
      Get.to(() => RiwayatTransaksi());
    });
  }
}
