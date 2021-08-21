import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage2_apptest/create_quote.dart';


void main() {
  runApp(QuoteBeaut());
}


class QuoteBeaut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}


