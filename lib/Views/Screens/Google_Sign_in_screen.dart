// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:get/get.dart';
//
// import '../../Componants/helpers/firebase_auth_helper.dart';
//
// class Google_screen extends StatefulWidget {
//   const Google_screen({super.key});
//
//   @override
//   State<Google_screen> createState() => _Google_screenState();
// }
//
// class _Google_screenState extends State<Google_screen> {
//   @override
//   Widget build(BuildContext context) {
//     // return FlutterLogin(
//     //   theme: LoginTheme(),
//     //   headerWidget: Column(
//     //     crossAxisAlignment: CrossAxisAlignment.center,
//     //     children: [
//     //       ElevatedButton(
//     //         onPressed: () {
//     //           Auth_Helper.auth_helper.SigninAnonymous().then(
//     //                 (value) => Navigator.pushNamed(
//     //               context,
//     //               'user',
//     //             ),
//     //           );
//     //         },
//     //         child: Text("Sign in Anonymously"),
//     //       ),
//     //       ElevatedButton(
//     //         onPressed: () async {
//     //           User? res = await Auth_Helper.auth_helper.signInWithGoogle();
//     //           if (res != null) {
//     //             Navigator.pushReplacementNamed(context, "user", arguments: res);
//     //           } else {}
//     //         },
//     //         child: Text("Google Sign in"),
//     //       ),
//     //     ],
//     //   ),
//     //   onSignup: (val) {
//     //     Auth_Helper.auth_helper
//     //         .SignUp(email: val.name!, password: val.password!);
//     //     Navigator.pop(context);
//     //   },
//     //   logo: NetworkImage("https://freepngimg.com/thumb/categories/1452.png"),
//     //   title: "WhatsApp",
//     //   initialAuthMode: AuthMode.signup,
//     //   userType: LoginUserType.email,
//     //   onLogin: (LoginData val) async {
//     //     Map<String, dynamic> res = await Auth_Helper.auth_helper
//     //         .SignIn(email: val.name, password: val.password);
//     //     if (res['user'] != null) {
//     //       Navigator.pushNamed(context, "user");
//     //       ScaffoldMessenger.of(context).showSnackBar(
//     //         SnackBar(
//     //           content: Text("Login SuccessFully...."),
//     //         ),
//     //       );
//     //     } else if (res['error'] != null) {
//     //       Navigator.pushNamed(context, '/');
//     //       ScaffoldMessenger.of(context).showSnackBar(
//     //         SnackBar(
//     //           content: Text("Login Failed...."),
//     //         ),
//     //       );
//     //     }
//     //   },
//     //   onRecoverPassword: (val) {},
//     // );
//     return Scaffold(
//       body: FlutterLogin(
//         headerWidget: Center(
//           child: GestureDetector(
//             onTap: ()async {
//               Map res = await Auth_Helper.auth_helper.AnonymousLogin();
//               if(res['user'] != null) {
//                 Get.snackbar("Chat App","Login SuccessFully");
//                 Get.toNamed("/user");
//               }else if(res['error'] != null){
//                 Get.snackbar("Chat App","Login Failed");
//                 Get.back();
//               }
//             },
//             child: Column(
//               children: [
//                 ElevatedButton(onPressed: ()async{
//                   User? res = await Auth_Helper.auth_helper.signInWithGoogle();
//                   if(res !=null){
//                     Get.offAllNamed("/user",arguments: res);
//                   }else{
//                     Get.snackbar("Chat App","Login Failed");
//                   }
//
//                 },
//                     child: Text("Login With Google"),),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   height: 50,
//                   width: 120,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(0,5),blurRadius: 6,spreadRadius: 0
//                       ),
//                     ],
//                   ),
//                   child: Text("Anonymous"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         theme: LoginTheme(),
//
//         onSignup: (val) async{
//           Map res = await Auth_Helper.auth_helper.SignUp(
//               email: val.name!, password: val.password!);
//           if(res['user'] != null) {
//             Get.snackbar("Chat App","Login SuccessFully");
//             Get.toNamed("/login");
//           }else if(res['error'] != null){
//             Get.snackbar("Chat App","Login Failed");
//             Get.toNamed("/");
//           }
//         },
//         onLogin: (val) async{
//
//           Map res = await Auth_Helper.auth_helper.SignIn(email: val.name, password: val.password);
//           if(res['user'] != null) {
//             Get.snackbar("Chat App","Login SuccessFully");
//             Get.toNamed("/user");
//           }else if(res['error'] != null){
//             Get.snackbar("Chat App","Login Failed");
//             Get.toNamed("/login");
//           }
//
//         }, onRecoverPassword: (String ) {},
//       ),
//     );
//   }
// }
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../../Componants/helpers/firebase_auth_helper.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      headerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ElevatedButton(
            onPressed: () async {
              User? res = await Auth_Helper.auth_helper.signInWithGoogle();
              if (res != null) {
             Get.offAllNamed('/home');

              } else {}
            },
            child: Text("Sign in with google"),
          ),
        ],
      ),
      onSignup: (val) {
        Auth_Helper.auth_helper
            .SignUp(email: val.name!, password: val.password!);
        Get.offAllNamed('/');
        //Navigator.pop(context);
      },
      logo: AssetImage("assets/images/logo/chat.png"),
     // title: "Chat App",
      initialAuthMode: AuthMode.signup,
      userType: LoginUserType.email,
      onLogin: (LoginData val) async {
        Map<String, dynamic> res = await Auth_Helper.auth_helper
            .SignIn(email: val.name, password: val.password);
        if (res['user'] != null) {
         Get.offAllNamed('home');
         Get.snackbar("Chat App", "Login Successfully..");
        } else if (res['error'] != null) {
        Get.offAllNamed('/');
        Get.snackbar("Chat App", "Login Failed..");
        }
      },
      onRecoverPassword: (val) {},
    );
  }
}