import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homesaloon_admin/modal/order_modal.dart';
import 'package:homesaloon_admin/modal/service_modal.dart';

class Firestorehelper {
  static Firestorehelper helper = Firestorehelper._();

  Firestorehelper._();

  FirebaseFirestore fire = FirebaseFirestore.instance;

  void insert(Servicemodal modal, String collection) {
    fire.collection("service").add({
      "detail": modal.name,
      "img":
          "https://img.freepik.com/free-photo/handsome-man-barber-shop-styling-hair_1303-20978.jpg",
      "type": "$collection",
      "price": modal.price,
      "time": modal.time,
      "description": modal.desc,
      "offer": modal.offer,
      "gender": modal.gender
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readdata() {
    return fire.collection("service").snapshots();
  }

  void update(Servicemodal modal, String collection) {
    fire.collection("service").doc("${modal.id}").set({
      "detail": modal.name,
      "img":
          "https://img.freepik.com/free-photo/handsome-man-barber-shop-styling-hair_1303-20978.jpg",
      "type": "$collection",
      "price": modal.price,
      "time": modal.time,
      "description": modal.desc,
      "offer": modal.offer,
      "gender": modal.gender
    });
  }

  void delete(String id) {
    print("id:===$id");
    fire.collection("service").doc("$id").delete();
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> read_order()
  {
    return fire.collectionGroup("buycart").snapshots();
  }

  void



  order_delete(String id)
  {
    fire.collectionGroup("buycart").parameters.remove("$id");
  }
}
