import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Views/Screens/Intro_screen.dart';
import 'package:flutter_chat_app/Views/Screens/Splash_Screen_h.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Views/Screens/Chat_Screen.dart';
import 'Views/Screens/Google_Sign_in_screen.dart';
import 'Views/Screens/Home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool visited = pref.getBool("isIntroVisited") ?? false;
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: (visited) ? '/SplashScreen' : '/IntroScreen',
      getPages: [
        GetPage(
          name: "/IntroScreen",
          page: () => IntroScreenPage(),
        ),
        GetPage(
          name: "/home",
          page: () => Home_Screen(),
        ),
        GetPage(
          name: "/SplashScreen",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: "/",
          page: () => Login_Screen(),
        ),
        GetPage(
          name: "/chat",
          page: () => Chat_Screen(),
        ),
      ],
    ),
  );
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'Views/Screens/Chat_Page_h.dart';
// import 'Views/Screens/Home_Page_h.dart';
// import 'Views/Screens/Login_Page_h.dart';
// import 'Views/Screens/Splash_Screen_h.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     const MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/SplashScreen',
//       getPages: [
//         GetPage(
//           name: "/SplashScreen",
//           page: () => const SplashScreen(),
//         ),
//         GetPage(
//           name: "/",
//           page: () => const HomePage(),
//         ),
//
//         GetPage(
//           name: "/LoginPage",
//           page: () => const LoginPage(),
//         ),
//         GetPage(
//           name: "/ChatPage",
//           page: () => const ChatPage(),
//         ),
//       ],
//     );
//   }
// }
