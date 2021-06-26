class PaymentsModel {
  static const ID = "id";
  static const CART = "cart";
  static const AMOUNT = "amount";
  static const CREATED_AT = "createdAt";

   String id;
   double amount;
   int createdAt;
   List cart;

  PaymentsModel({this.id, this.amount,this.createdAt, this.cart});

  PaymentsModel.fromMap(Map data){
    id = data[ID];
    createdAt = data[CREATED_AT];
    amount = data[AMOUNT].toDouble();
    cart = data[CART];
  }
}