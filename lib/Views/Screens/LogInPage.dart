
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../../Componants/helpers/firebase_auth_helper.dart';

class LogIn_Page extends StatefulWidget {
  const LogIn_Page({super.key});

  @override
  State<LogIn_Page> createState() => _LogIn_PageState();
}

class _LogIn_PageState extends State<LogIn_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(onLogin: (val)async{

        Map res = await Auth_Helper.auth_helper.SignIn(email: val.name, password: val.password);

        if(res['user'] != null){
          Get.snackbar("Chat App","Login SuccessFully");
          Get.toNamed("/user");
        }else if (res['error'] != null){
          Get.snackbar("Chat App","Login Failed");
          Get.toNamed("/login");
        }
      }, onRecoverPassword: (String){}),
    );
  }
}
