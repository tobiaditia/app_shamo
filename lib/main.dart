import 'package:app_shamo/pages/home/cart_page.dart';
import 'package:app_shamo/pages/home/chat_detail_page.dart';
import 'package:app_shamo/pages/home/checkout_page.dart';
import 'package:app_shamo/pages/home/checkout_success_page.dart';
import 'package:app_shamo/pages/home/edit_profile.dart';
import 'package:app_shamo/pages/home/main_page.dart';
import 'package:app_shamo/pages/home/product_page.dart';
import 'package:app_shamo/pages/sign_in_page.dart';
import 'package:app_shamo/pages/sign_up_page.dart';
import 'package:app_shamo/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}