import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/UserModel.dart';

class CloudFirestoreHelper {
  CloudFirestoreHelper._();

  static final CloudFirestoreHelper cloudFirestoreHelper =
      CloudFirestoreHelper._();

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference userDetailRef;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();
  void connectWithUserCollection() {
    userDetailRef = firebaseFirestore.collection('users');
  }

  Future<void> insertUserDetail({
    String? id,
    String? email,
    String? password,
    String? name,
  }) async {
    connectWithUserCollection();
     userModel = UserModel(
      id: id,
      username: name,
      email: email,
    );
    await userDetailRef.doc(id).set(userModel.toMap());
  }

  Future<void> updateUserDetail({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
  }) async {
    connectWithUserCollection();
    Map<String, dynamic> data = {
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
    };
    await userDetailRef.doc(id).update(data);
  }

  Future<void> deleteUser({required String id}) async {
    connectWithUserCollection();
    await userDetailRef.doc(id).delete();
  }
}
