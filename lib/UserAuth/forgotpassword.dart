import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:onlineshes/UserAuth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../variable/constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

TextEditingController forgot = TextEditingController();

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgotKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,        // backgroundColor: transparent,
        body: Stack(children: [
          const Image(

            image: AssetImage("Assets/images/bg1.png"),

            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                      key: forgotKey,
                      child: Column(
                        children: [
                          const Text(
                            "Get your new Password in your email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: fontWeight,
                                fontSize: 20,
                                color: arbitraryColor),
                          ),
                          const Gap(20),
                          // Two in Text form fields fro the login  page
                          TextFormField(
                            autocorrect: true,
                            autofillHints: [AutofillHints.email],
                            textAlign: TextAlign.center,
                            controller: forgot,
                            validator: (forgotValue) {
                              if (forgotValue!.isEmpty) {
                                return "Please enter your email";
                              } else if (RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(forgotValue)) {
                                return null;
                              } else {
                                return "please enter your valid email";
                              }
                            },
                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.mail_lock_outlined,
                                  color: arbitraryColor,
                                  size: iconsize,
                                ),
                                label: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontWeight: fontWeight,
                                      fontSize: fontsize,
                                      color: arbitraryColor),
                                ),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 2, color: subColor))),
                          ),
                          const Gap(15),
                          GestureDetector(
                            onTap: () {
                              if (forgotKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                          child: SimpleCircularProgressBar(
                                        progressStrokeWidth: 10,
                                        mergeMode: true,
                                        backStrokeWidth: 10,
                                        fullProgressColor:
                                            Colors.green.shade700,
                                        animationDuration: 2,
                                        size: 100,
                                        startAngle: 50,
                                      ));
                                    });
                                try {
                                  FirebaseAuth.instance
                                      .sendPasswordResetEmail(
                                          email: forgot.text.trim())
                                      .then((value) => Get.to(
                                          () => const Login(),
                                          transition: Transition.circularReveal,
                                          duration: const Duration(
                                              milliseconds: 500)));
                                } catch (error) {
                                  Get.snackbar(
                                      "Message", "your basket is still empty",
                                      backgroundColor: Colors.black87,
                                      snackPosition: SnackPosition.TOP,
                                      messageText: Text(
                                        error.toString(),
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      duration: const Duration(seconds: 2),
                                      titleText: const Text(
                                        "Items",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ));
                                }

                                forgot.clear();
                              }
                            },
                            child: Container(
                              height: primaryheight,
                              width: primaryWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(6, 6),
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                                  const BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(-6, -6),
                                    color: Colors.white10,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                    fontSize: fontsize,
                                    fontWeight: fontWeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
