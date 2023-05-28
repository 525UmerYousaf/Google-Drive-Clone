import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/authentication_controller.dart';

import '../utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurpleAccent,
            Colors.purpleAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                //  Below I'm providing padding at the top of screen
                //  it is bascally the space occupied by mobile upper
                //  swipable menu.
                top: MediaQuery.of(context).viewInsets.top + 52,
              ),
              child: const Image(
                width: 200,
                height: 200,
                image: AssetImage('assets/images/filemanager.png'),
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.white, spreadRadius: 5),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Simplify your",
                      style: textStyle(
                          25, const Color(0xff635C9B), FontWeight.w700),
                    ),
                    Text(
                      "filing system",
                      style: textStyle(
                          25, const Color(0xff635C9B), FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "keep your files",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    Text(
                      "organized more easily",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => Get.find<AuthController>().login(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrangeAccent.withOpacity(0.8),
                        ),
                        child: Center(
                          child: Text(
                            "Let's go",
                            style: textStyle(23, Colors.white, FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
