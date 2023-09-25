import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({Key? key}) : super(key: key);

  @override
  State<IntroScreenPage> createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  @override
  static const String KeyVisit = "Visit";
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to ChatApp",
            body :"Connect with friends and chat anytime, anywhere.",

          //  image: Image.asset(ImagePath + P1),
          ),
          PageViewModel(
            title: "Stay Connected",
            body: "Send messages, photos, and videos to your contacts.",
         //   image: Image.asset(ImagePath + P2),
          ),
          PageViewModel(
            body: "Send Greetings and Share your Thoughts with Friend and Family",
            title: "Stay Happy & Connected With Family",
          //  image: Image.asset(ImagePath + P3),
          ),
          PageViewModel(
            title: "Get Started",
            body: "Join the conversation and start chatting now!",
           // image: Image.asset(ImagePath + P4),
          ),
          PageViewModel(
            body: "Open A New Digital Savings Account Within A Few Minutes",
            title: "Instant Account Opening",
          //  image: Image.asset(ImagePath + P5),
          ),
        ],
        done: const Text("Done"),
        showNextButton: false,
        onDone: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool("isIntroVisited", true);
         Get.offAllNamed('/SplashScreen');
        },
      ),
    );
  }


}