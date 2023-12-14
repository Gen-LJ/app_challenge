import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference products =
          FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(String name,String price,String phNo,String address) {
    return products.add({
      'name' : name,
      'price': price,
      'phNo' : phNo,
      'address' : address,
      'timestamp' : Timestamp.now()
    });
}
  Stream<QuerySnapshot> getProductStream(){
    final productStream =
    products.orderBy('timestamp',descending: true).snapshots();
    return productStream;
  }
}