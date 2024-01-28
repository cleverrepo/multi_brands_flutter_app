import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:onlineshes/UserAuth/forgotpassword.dart';
import 'package:onlineshes/UserAuth/signup.dart';
import 'package:onlineshes/homepage/home.dart';
import 'package:onlineshes/variable/constants.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool visibility = false;

class _LoginState extends State<Login> {
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Stack(children: [
          const Image(

            image: AssetImage("Assets/images/bg1.png"),

            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                        key: globalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Two in Text form fields fro the login  page
                            TextFormField(
                              autocorrect: true,
                               autofillHints: const [AutofillHints.email],
                              textAlign: TextAlign.center,
                              controller: emailController,
                              validator: (emailValue) {
                                if (emailValue!.isEmpty) {
                                  return "Please enter your email";
                                } else if (RegExp(
                                        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                    .hasMatch(emailValue)) {
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
                              obscureText: visibility,
                              autocorrect: true,
                              autofillHints: const [AutofillHints.password],
                              textAlign: TextAlign.center,
                              controller: passwordController,
                              validator: (passwordValue) {
                                if (passwordValue!.isEmpty) {
                                  return "Please enter your password";
                                } else if (passwordValue.length < 8) {
                                  return "incorrect password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    child: visibility
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
                                          color: arbitraryColor, width: 2))),
                            ),
                            const Gap(10),
                            // this is where my first onTap Function is
                            GestureDetector(
                              onTap: () async {
                                if (globalKey.currentState!.validate()) {
                                  showLoadingIndicator(context);
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                    navigateToHomeScreen();
                                  } catch (e) {
                                    Get.snackbar("Error", e.toString(),
                                        duration: const Duration(seconds: 3));
                                  }
                                  passwordController.clear();
                                  emailController.clear();
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
                                    "Login",
                                    style: TextStyle(
                                      fontSize: fontsize,
                                      fontWeight: fontWeight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
            
                            TextButton(
                              onPressed: () {
                                Get.to(() => const ForgotPassword(),
                                    transition: Transition.cupertinoDialog,
                                    duration:
                                        const Duration(milliseconds: 500));
                              },
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(
                                    fontSize: fontsize,
                                    fontWeight: fontWeight,
                                    color: arbitraryColor),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontSize: fontsize,
                                    fontWeight: fontWeight,
                                  ),
                                ),
                                // if user don't have account, he can register using register button
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const Register(),
                                        transition: Transition.cupertinoDialog,
                                        duration:
                                            const Duration(milliseconds: 500));
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        fontSize: fontsize,
                                        fontWeight: fontWeight,
                                        color: arbitraryColor),
                                  ),
                                )
                              ],
                            ),
                            const Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  color: mainColor,
                                  thickness: 2,
                                )),
                                Text("or",
                                    style: TextStyle(
                                        fontSize: fontsize,
                                        fontWeight: fontWeight,
                                        color: arbitraryColor)),
                                Expanded(
                                    child: Divider(
                                  color: mainColor,
                                  thickness: 2,
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    height: secondaryHeight,
                                    width: secondaryWidth,
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
                                    child: const Image(
                                      image: AssetImage(
                                          "Assets/images/google.png"),
                                    )),
                                Container(
                                    height: secondaryHeight,
                                    width: secondaryWidth,
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
                                    child: const Image(
                                      image: AssetImage(
                                          "Assets/images/facebook.png"),
                                      fit: BoxFit.contain,
                                    )),
                                Container(
                                    height: secondaryHeight,
                                    width: secondaryWidth,
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
                                    child: const Image(
                                      image: AssetImage(
                                          "Assets/images/twitter.png"),
                                      width: secondaryWidth,
                                      fit: BoxFit.contain,
                                      height: secondaryHeight,
                                    )),
                              ],
                            ),
                          ],
                        )),
                  )
                ],
              ),
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

  void navigateToHomeScreen() {
    Get.to(() => const Home(),
        transition: Transition.circularReveal,
        duration: const Duration(milliseconds: 500));
  }
}
