// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../Componants/helpers/firebase_auth_helper.dart';
// import '../../controllers/password.dart';
// import '../../utils/attributes.dart';
//
// class guest_login_screen extends StatefulWidget {
//   const guest_login_screen({super.key});
//
//   @override
//   State<guest_login_screen> createState() => _guest_login_screenState();
// }
//
// class _guest_login_screenState extends State<guest_login_screen> {
//   bool isVisibility = false;
//   PasswordShowHideController passwordShowHideController =
//   Get.put(PasswordShowHideController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.yellow,
//             image: DecorationImage(
//               image: AssetImage("assets/images/loginscreen/loginscreen.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Text(
//                     "English (US)",
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         color: Color(0xff7f8d95),
//                         // fontSize: 12.sp,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Image.asset(
//                     "assets/images/splachscreen/instragram_logo.png",
//                     height: 100,
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Text(
//                     "Login as a Guest",
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         color: Color(0xff7f8d95),
//                         // fontSize: 12.sp,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   TextFormField(
//                     style: GoogleFonts.montserrat(
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         // fontSize: 13.sp,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                     controller: userNameController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: "Username,email or mobile number",
//                       labelStyle: GoogleFonts.montserrat(
//                         textStyle: TextStyle(
//                           color: Color(0xffa7abac),
//                           //  fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 0.3,
//                         ),
//                       ),
//                       hintText: "Username,email or mobile number",
//                       hintStyle: GoogleFonts.montserrat(
//                         textStyle: TextStyle(
//                           color: Color(0xffa7abac),
//                           // fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 0.3,
//                         ),
//                       ),
//                       suffixIcon: (userNameController.text == "")
//                           ? Icon(
//                         Icons.clear,
//                         color: Colors.white,
//                       )
//                           : IconButton(
//                         onPressed: () {
//                           userNameController.clear();
//                           setState(() {});
//                         },
//                         icon: Icon(Icons.close),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color(0xffa7abac),
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color(0xffa7abac),
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   GetBuilder<PasswordShowHideController>(builder: (_) {
//                     return TextFormField(
//                       obscureText: (passwordShowHideController
//                           .passwordShowHideModel.isVisibility)
//                           ? false
//                           : true,
//                       obscuringCharacter: "*",
//                       style: GoogleFonts.montserrat(
//                         textStyle: TextStyle(
//                           color: Colors.black,
//                           //fontSize: 13.sp,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 1.5,
//                         ),
//                       ),
//                       controller: passwordController,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelText: "Password",
//                         labelStyle: GoogleFonts.montserrat(
//                           textStyle: TextStyle(
//                             color: Color(0xffa7abac),
//                             //  fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.3,
//                           ),
//                         ),
//                         hintText: "Password",
//                         hintStyle: GoogleFonts.montserrat(
//                           textStyle: TextStyle(
//                             color: Color(0xffa7abac),
//                             // fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.3,
//                           ),
//                         ),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             // isVisibility = !isVisibility;
//                             // setState(() {});
//                             passwordShowHideController.changeVisibility();
//                           },
//                           icon: (passwordShowHideController
//                               .passwordShowHideModel.isVisibility)
//                               ? Icon(Icons.visibility)
//                               : Icon(Icons.visibility_off),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xffa7abac),
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xffa7abac),
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     );
//                   }),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Auth_Helper.auth_helper.SigninAnonymous().then(
//                             (value) => Navigator.pushNamed(
//                           context,
//                           'home',
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 60,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xff0064e0),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Log in",
//                         style: GoogleFonts.montserrat(
//                           textStyle: TextStyle(
//                             color: Colors.white,
//                             // fontSize: 12.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
