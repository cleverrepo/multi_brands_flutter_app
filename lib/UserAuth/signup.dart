import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onlineshes/UserAuth/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../variable/constants.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

TextEditingController mail = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirm = TextEditingController();
bool visible = false;
bool open = false;

class _RegisterState extends State<Register> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,

        // backgroundColor: transparent,
        body: Stack(children: [
          const Image(

            image: AssetImage("Assets/images/bg1.png"),
            // image: AssetImage("Assets/Amina/images.jpg"),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          // Two in Text form fields fro the login  page
                          TextFormField(
                            autocorrect: true,
                            autofillHints: const [AutofillHints.email],
                            textAlign: TextAlign.center,
                            controller: mail,
                            validator: (mailValue) {
                              if (mailValue!.isEmpty) {
                                return "please enter your email";
                              } else if (RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(mailValue)) {
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
                                    borderSide: BorderSide(
                                        width: 2, color: subColor))),
                          ),

                          TextFormField(
                            obscureText: visible,
                            autocorrect: true,
                            autofillHints: const [AutofillHints.password],
                            textAlign: TextAlign.center,
                            controller: password,
                            validator: (passValue) {
                              if (passValue!.isEmpty) {
                                return "please enter your password";
                              } else if (passValue.length < 8) {
                                return "password should be at least 8 characters";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                  child: visible
                                      ? const Icon(
                                          Icons.visibility_outlined,
                                          color: arbitraryColor,
                                          size: iconsize,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: arbitraryColor,
                                          size: iconsize,
                                        ),
                                ),
                                label: const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: fontWeight,
                                      fontSize: fontsize,
                                      color: arbitraryColor),
                                ),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: subColor))),
                          ),

                          TextFormField(
                            obscureText: open,
                            autocorrect: true,
                            autofillHints: const [AutofillHints.password],
                            textAlign: TextAlign.center,
                            controller: confirm,
                            validator: (confirmValue) {
                              if (confirmValue!.isEmpty) {
                                return "please enter your password";
                              } else if (confirmValue == password.text) {
                                return null;
                              } else if (confirmValue.length < 8) {
                                return "password should be more than 8 characters";
                              } else {
                                return " password didn't match ";
                              }
                            },
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      open = !open;
                                    });
                                  },
                                  child: open
                                      ? const Icon(
                                          Icons.visibility_outlined,
                                          color: arbitraryColor,
                                          size: iconsize,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: arbitraryColor,
                                          size: iconsize,
                                        ),
                                ),
                                label: const Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      fontWeight: fontWeight,
                                      fontSize: fontsize,
                                      color: arbitraryColor),
                                ),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: subColor))),
                          ),
                          const Gap(5),
                          // this is where my first onTap Function is
                          GestureDetector(
                            onTap: () async {
                              if (_key.currentState!.validate()) {
                                showLoadingIndicator(context);
                                try {
                                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: mail.text,
                                    password: password.text,
                                  );
                                  navigateToLoginScreen();
                                } catch (error) {
                                  handleSignupError(context, error);
                                }
                                clearTextFields();
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
                                  "Signup",
                                  style: TextStyle(
                                    fontSize: fontsize,
                                    fontWeight: fontWeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Already  have an account?",
                                style: TextStyle(
                                  fontSize: fontsize,
                                  fontWeight: fontWeight,
                                ),
                              ),
                              // if user don't have account, he can register using register button
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const Login(),
                                      transition: Transition.cupertinoDialog,
                                      duration:
                                          const Duration(milliseconds: 500));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: fontsize,
                                      fontWeight: fontWeight,
                                      color: arbitraryColor),
                                ),
                              )
                            ],
                          ),

                          // user can continue  using google, facebook of his twitter account
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
  void showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SimpleCircularProgressBar(
            progressStrokeWidth: 10,
            mergeMode: true,
            backStrokeWidth: 10,
            fullProgressColor: Colors.green.shade700,
            animationDuration: 2,
            size: 100,
            startAngle: 50,
          ),
        );
      },
    );
  }

  void navigateToLoginScreen() {
    Navigator.pop(context); // Dismiss the loading dialog
    Get.to(() => const Login(),
        transition: Transition.circularReveal,
        duration: const Duration(milliseconds: 500));
  }

  void handleSignupError(BuildContext context, dynamic error) {
    Navigator.pop(context); // Dismiss the loading dialog
    Get.snackbar(
      "Error",
      error.toString(),
    );
  }

  void clearTextFields() {
    password.clear();
    mail.clear();
    confirm.clear();
  }
}
