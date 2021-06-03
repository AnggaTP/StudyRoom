import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_room/Models/user.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("user").doc(user.uid).set({
        'username': user.username,
        'email': user.email,
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> createRoom(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("room").doc(user.uid).set({});
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    try {
      DocumentSnapshot _docSnapShot =
          await _firestore.collection("user").doc(uid).get();
      retVal.uid = uid;
      retVal.username = _docSnapShot.data();
      retVal.email = _docSnapShot.data();
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
