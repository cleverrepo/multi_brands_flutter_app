import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onlineshes/UserAuth/login.dart';
import 'package:onlineshes/variable/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

final onboard = [
  "Assets/onboarding/ice.jpg",
  "Assets/onboarding/stylish-elegant-leather.jpg",
  "Assets/onboarding/pair-trainers.jpg",
  "Assets/onboarding/fashion-shoes-sneakers.jpg",
];
final meaningfulText = [
  "Step into a world of style and comfort. Welcome to "
      "Cshoes, where every step is a statement. "
      "Explore an extensive collection of footwear from top brands.",
  "Discover diversity in every step! Cshoes brings you a curated selection of shoes from multiple renowned brands."
      " Find the perfect pair that complements your unique style.",
  "Seamless shopping at your fingertips. With our intuitive design,"
      " finding and buying your favorite shoes is as easy as a walk in the park."
      " Enjoy a hassle-free shopping experience",
  "Seamless shopping at your fingertips. With our intuitive design, finding and buying your favorite shoes is as easy as a walk in the park. "
      "Enjoy a hassle-free shopping experience",
  "Unlock exclusive deals and offers! As a part of the [Your App Name] community, you get access to special discounts and promotions. "
      "Step into savings with every purchase."
];
PageController pagecontroller = PageController();
bool lastPage = false;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        PageView.builder(
            itemCount: onboard.length,
            controller: pagecontroller,
            onPageChanged: (changed) {
              setState(() {
                lastPage = (changed == 3);
              });
            },
            itemBuilder: (BuildContext, int index) {
              return Column(
                children: [
                  Image(
                    image: AssetImage(
                      onboard[index],
                    ),
                    width: 500,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      meaningfulText[index],
                      style: const TextStyle(
                          fontSize: fontsize, fontWeight: fontWeight),
                    ),
                  )
                ],
              );
            }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    pagecontroller.jumpToPage(4);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: arbitraryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 20,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: fontsize,
                        fontWeight: fontWeight,
                        color: mainColor),
                  )),
              SmoothPageIndicator(
                effect: const JumpingDotEffect(
                    activeDotColor: generalColor,
                    jumpScale: 2,
                    paintStyle: PaintingStyle.fill,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.black54),
                controller: pagecontroller,
                count: onboard.length,
              ),
              lastPage
                  ? ElevatedButton(
                      onPressed: () {
                        Get.to(()=> Login(),
                        duration: const Duration(milliseconds: 500),

                          transition: Transition.leftToRightWithFade,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: arbitraryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 20,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      child: const Text(
                        "Done",
                        style: TextStyle(
                            fontSize: fontsize,
                            color: mainColor,
                            fontWeight: fontWeight),
                      ))
                  : ElevatedButton(
                      onPressed: () {
                        pagecontroller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.bounceInOut);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: arbitraryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 20,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontSize: fontsize,
                            color: mainColor,
                            fontWeight: fontWeight),
                      ))
            ],
          ),
        ),

      ])),
    );
  }
}
