import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../variable/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 2,
              child: Column(
            children: [
              Container(
                height: customHeight,
                width: customWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.edit,color: Colors.white,),
                    Text(
                      "Edit your profile information",
                      style: TextStyle(
                          fontSize: fontsize,
                          color: arbitraryColor,
                          fontWeight: fontWeight),
                    )
                  ],
                ),
              ),
              const Gap(15),
              Container(
                height: customHeight,
                width: customWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.wallet),
                    Text(
                      "Wallet",
                      style: TextStyle(
                          fontSize: fontsize,
                          color: arbitraryColor,
                          fontWeight: fontWeight),
                    )
                  ],
                ),
              ),
              const Gap(15),
              Container(
                height: customHeight,
                width: customWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.payment),
                    Text(
                      "payment Method",
                      style: TextStyle(
                          fontSize: fontsize,
                          color: arbitraryColor,
                          fontWeight: fontWeight),
                    )
                  ],
                ),
              ),
              const Gap(15),
              Container(
                height: customHeight,
                width: customWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.car_repair),
                    Text(
                      "Order tracking",
                      style: TextStyle(
                          fontSize: fontsize,
                          color: arbitraryColor,
                          fontWeight: fontWeight),
                    )
                  ],
                ),
              ),
              const Gap(15),
              Container(
                height: customHeight,
                width: customWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.privacy_tip_outlined),
                    Text(
                      "Privacy ",
                      style: TextStyle(
                          fontSize: fontsize,
                          color: arbitraryColor,
                          fontWeight: fontWeight),
                    )
                  ],
                ),
              ),
              const Gap(15),
              Container(
                height: customHeight,
                width: customWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.edit),
                    Text(
                      "Edit your profile infomation",
                      style: TextStyle(
                          fontSize: fontsize,
                          color: arbitraryColor,
                          fontWeight: fontWeight),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
