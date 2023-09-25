// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'firebase_cloud_firestore_helper.dart';
//
// class Auth_Helper {
//   Auth_Helper._();
//
//   static Auth_Helper auth_helper = Auth_Helper._();
//   static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   static GoogleSignIn googleSignIn = GoogleSignIn();
//
// //Anonymous auth
//
//   Future<Map<String, dynamic>> AnonymousLogin() async {
//     Map<String, dynamic> res = {};
//     try {
//       UserCredential userCredential = await firebaseAuth.signInAnonymously();
//       res['user'] = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       res['error'] = e.code;
//     }
//     return res;
//   }
//
//   //Sign up
//
//   Future<Map<String, dynamic>> SignUp(
//       {required String email, required String password}) async {
//     Map<String, dynamic> res = {};
//     try {
//       UserCredential userCredential = await firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       res['user'] = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       res['error'] = e.code;
//     }
//     return res;
//   }
//
//   // Sign in
//
//   Future<Map<String, dynamic>> SignIn(
//       {required String email, required String password}) async {
//     Map<String, dynamic> res = {};
//     try {
//       UserCredential userCredential = await firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//       Cloud_helper.cloud_helper.addUser(data: {
//         "email": userCredential.user?.email,
//         "uid": userCredential.user?.uid
//       });
//       res['user'] = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       res['error'] = e.code;
//     }
//     return res;
//   }
//   //Google Signin
// Future<User?> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//     User? user = userCredential.user;
//     Cloud_helper.cloud_helper.addUser(data:{
//       "email": userCredential.user?.email,
//       "uid": userCredential.user?.uid});
//     return user;
// }
//
// //signout
//
// Future<void> signOut() async {
//     await firebaseAuth.signOut();
//     await googleSignIn.signOut();
// }
//
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_cloud_firestore_helper.dart';

class Auth_Helper {
  Auth_Helper._();

  static Auth_Helper auth_helper = Auth_Helper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> SigninAnonymous() async {
    UserCredential userCredential = await firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<User?> SignUp(
      {required String email, required String password}) async {
    UserCredential userCredential =
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<Map<String, dynamic>> SignIn(
      {required String email, required String password}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      FireStore_Helper.fireStore_Helper.addUser(data: {
        "email": userCredential.user?.email,
        "uid": userCredential.user?.uid,
      });
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  // SigninWith Google
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    var credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
    await firebaseAuth.signInWithCredential(credential);

    User? user = userCredential.user;
    FireStore_Helper.fireStore_Helper.addUser(data: {
      "email": user?.email,
      "uid": user?.uid,

    });
    return user;
  }

  void SignOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}