import 'package:flutter/material.dart';
import 'home.dart';
import 'choose_location.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
    //home:Home(),    //gets conflicted with routes so remove home
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Home(),
      '/loaction': (context) => ChooseLocation(),
    },

  ));
}