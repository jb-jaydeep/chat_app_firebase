// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'firebase_auth_helper.dart';
//
// class Cloud_helper {
//   Cloud_helper._();
//
//   static Cloud_helper cloud_helper = Cloud_helper._();
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   CollectionReference user = FirebaseFirestore.instance.collection('user');
//
//   addUser({required Map<String, dynamic> data}) {
//     firebaseFirestore
//         .collection("user")
//         .doc("${Auth_Helper.firebaseAuth.currentUser?.uid}")
//         .set(data);
//   }
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
//     return firebaseFirestore
//         .collection("user")
//         .where("uid", isNotEqualTo: Auth_Helper.firebaseAuth.currentUser?.uid)
//         .snapshots();
//   }
//
//   Future<void> deleteuser({required String uid}) async {
//     await firebaseFirestore.collection("user").doc(uid).delete();
//   }
//
//   Future<void> sendMessage({
//     required String uid1,
//     required String uid2,
//     required String msg,
//   }) async {
//     String user1 = uid1;
//     String user2 = uid2;
//
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await firebaseFirestore.collection("chat").get();
//
//     List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
//         await querySnapshot.docs;
//
//     bool chatRoomAvailable = false;
//     String fetcheduser1 = "";
//     String fetcheduser2 = "";
//
//     for (QueryDocumentSnapshot<Map<String, dynamic>> element in allDocs) {
//       String u1 = element.id.split("_")[0];
//       String u2 = element.id.split("_")[1];
//
//       if ((u1 == user1 || u1 == user2) && (u2 == user1 || u2 == user2)) {
//         chatRoomAvailable = true;
//         fetcheduser1 = element.data()['users'][0];
//         fetcheduser2 = element.data()['users'][1];
//       }
//     }
//     if (chatRoomAvailable == false) {
//       await firebaseFirestore.collection("chat").doc("${user1}_$user2").set({
//         "users": [uid1, uid2]
//       });
//
//       await firebaseFirestore
//           .collection("chat")
//           .doc("${user1}_$user2")
//           .collection("messages")
//           .add({
//         "sentby": uid1,
//         "receiveby": uid2,
//         "msg": msg,
//         "time": FieldValue.serverTimestamp(),
//       });
//     } else {
//       await firebaseFirestore
//           .collection("chat")
//           .doc("${fetcheduser1}_$fetcheduser2")
//           .collection("messages")
//           .add({
//         "sentby": uid1,
//         "receiveby": uid2,
//         "msg": msg,
//         "time": FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   Future<Stream<QuerySnapshot<Map<String, dynamic>>>> DisplayMessage(
//       {required String uid1, required String uid2}) async {
//
//     String user1 = uid1;
//     String user2 = uid2;
//
//     QuerySnapshot<Map<String,dynamic>> querySnapshot = await firebaseFirestore.collection("chat").get();
//
//     List<QueryDocumentSnapshot<Map<String,dynamic>>> allDocs = await querySnapshot.docs;
//     bool chatRoomAvailable = false;
//     String fetcheduser1 = "";
//     String fetcheduser2 = "";
//     for (QueryDocumentSnapshot<Map<String, dynamic>> element in allDocs) {
//       String u1 = element.id.split("_")[0];
//       String u2 = element.id.split("_")[1];
//
//       if ((u1 == user1 || u1 == user2) && (u2 == user1 || u2 == user2)) {
//         chatRoomAvailable = true;
//         fetcheduser1 = element.data()['users'][0];
//         fetcheduser2 = element.data()['users'][1];
//       }
//     }
//     if (chatRoomAvailable == false) {
//       await firebaseFirestore.collection("chat").doc("${user1}_$user2").set({
//         "users": [uid1, uid2]
//       });
//
//       return firebaseFirestore
//           .collection("chat")
//           .doc("${user1}_$user2")
//           .collection("messages")
//           .snapshots();
//     } else {
//       return firebaseFirestore
//           .collection("chat")
//           .doc("${fetcheduser1}_$fetcheduser2")
//           .collection("messages").orderBy("time",descending: true).snapshots();
//
//     }
//   }
// }

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_auth_helper.dart';

class FireStore_Helper {
  //TODO: Private Constructor
  FireStore_Helper._();
  //TODO: Singleton Object
  static final FireStore_Helper fireStore_Helper = FireStore_Helper._();
  //TODO: Cloud_firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //TODO:Coolection Created
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //TODO:Add User to Firebase Cloud_Firestore
  Future<void> addUser({required Map<String, dynamic> data}) async {
    // return users.add(data);
    await firestore
        .collection("users")
        .doc("${Auth_Helper.auth_helper.firebaseAuth.currentUser?.uid}")
        .set(data);
  }

  //TODO:Display User to UI from Cloud_Firestore
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUsers() {
    return firestore
        .collection("users")
        .where("uid",
        isNotEqualTo: Auth_Helper.auth_helper.firebaseAuth.currentUser?.uid)
        .snapshots();
  }

  //TODO:Delete User From Cloud_Firestore
  Future<void> deleteUser({required String uid}) async {
    await firestore.collection("users").doc(uid).delete();
  }

  //TODO:Send Message
  Future<void> sendMessage({
    required String uid1,
    required String uid2,
    required String msg,
  }) async {
    String user1 = uid1;
    String user2 = uid2;

    //TODO:Check If User Already Exist or not
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firestore.collection("chat").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
    await querySnapshot.docs;

    bool isChatRoomAvailable = false;
    String fetcheduser1 = "";
    String fetcheduser2 = "";

    //TODO:Check ChatRoom Already Available or Not
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in allDocs) {
      String u1 = element.id.split("_")[0];
      String u2 = element.id.split("_")[1];

      if ((user1 == u1 || user2 == u1) && (user1 == u2 || user2 == u2)) {
        isChatRoomAvailable = true;
        fetcheduser1 = element.data()["users"][0];
        fetcheduser2 = element.data()["users"][1];
      }
    }

    //TODO:What if ChatRoom is Not Available
    if (isChatRoomAvailable == false) {
      log("==============Chat Room is Not Available==============");
      await firestore.collection("chat").doc("${uid1}_${uid2}").set({
        "users": [uid1, uid2],
      });

      await firestore
          .collection("chat")
          .doc("${uid1}_${uid2}")
          .collection("messages")
          .add({
        "sentby": uid1,
        "receivedby": uid2,
        "msg": msg,
      });
    } else {
      //TODO:What if ChatRoom is Available
      log("==============Chat Room is Available==============");
      await firestore
          .collection("chat")
          .doc("${fetcheduser1}_${fetcheduser2}")
          .collection("messages")
          .add({
        "sentby": uid1,
        "receivedby": uid2,
        "timestamp": FieldValue.serverTimestamp(),
        "msg": msg,
      });
    }
  }
//TODO:Display Message

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> DisplayMessage({
    required String uid1,
    required String uid2,
  }) async {
    String user1 = uid1;
    String user2 = uid2;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firestore.collection("chat").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
    await querySnapshot.docs;
    bool isChatRoomAvailable = false;
    String fetcheduser1 = "";
    String fetcheduser2 = "";
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in allDocs) {
      String u1 = element.id.split("_")[0];
      String u2 = element.id.split("_")[1];

      if ((user1 == u1 || user2 == u1) && (user1 == u2 || user2 == u2)) {
        isChatRoomAvailable = true;
        fetcheduser1 = element.data()["users"][0];
        fetcheduser2 = element.data()["users"][1];
      }
    }
    if (isChatRoomAvailable == false) {
      log("==============Chat Room is Not Available==============");
      await firestore.collection("chat").doc("${uid1}_${uid2}").set({
        "users": [uid1, uid2],
      });

      return firestore
          .collection("chat")
          .doc("${uid1}_${uid2}")
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots();
    } else {
      log("==============Chat Room is Available==============");
      return firestore
          .collection("chat")
          .doc("${fetcheduser1}_${fetcheduser2}")
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots();
    }
  }

  //TODO:Delete Chat From Cloud_Firestore
  Future<void> DeleteChat(
      {required String uid, required String uid1, required String uid2}) async {
    await firestore
        .collection("chat")
        .doc("${uid1}_${uid2}")
        .collection("messages")
        .doc(uid)
        .delete();
  }
}
