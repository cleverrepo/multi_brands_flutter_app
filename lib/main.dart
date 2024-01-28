import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onlineshes/UserAuth/login.dart';
import 'package:onlineshes/firebase_options.dart';
import 'package:onlineshes/homepage/onbording.dart';
import 'package:provider/provider.dart';
import 'Statemangemant/stateprovider.dart';
import 'Statemangemant/themeprovider.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderManagement()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: OnBoardingScreen(),
    );
  }
}
