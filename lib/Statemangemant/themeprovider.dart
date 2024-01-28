import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool darkTheme=false;
  bool get darktheme=>darkTheme;
  void toggledTheme(){
    darkTheme=!darkTheme;
    notifyListeners();
  }

}