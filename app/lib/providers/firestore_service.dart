import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Stream<QuerySnapshot> productos() {
    return FirebaseFirestore.instance.collection('productos').snapshots();
  }

  Future productosAgregar(String nombre, int stock, int precio) async {
    var productosRef = FirebaseFirestore.instance.collection('productos').doc();
    productosRef.set({
      'nombre': nombre,
      'stock': stock,
      'precio': precio,
    });
  }

  Future productosBorrar(String productoId) {
    return FirebaseFirestore.instance
        .collection('productos')
        .doc(productoId)
        .delete();
  }
}
