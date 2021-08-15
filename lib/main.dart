import 'package:app_shamo/models/product_model.dart';
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
import 'package:app_shamo/providers/auth_provider.dart';
import 'package:app_shamo/providers/cart_provider.dart';
import 'package:app_shamo/providers/product_provider.dart';
import 'package:app_shamo/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
