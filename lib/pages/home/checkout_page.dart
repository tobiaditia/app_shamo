import 'package:app_shamo/providers/auth_provider.dart';
import 'package:app_shamo/providers/cart_provider.dart';
import 'package:app_shamo/providers/transaction_provider.dart';
import 'package:app_shamo/theme.dart';
import 'package:app_shamo/widgets/checkout_card.dart';
import 'package:app_shamo/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });
      if (await transactionProvider.checkout(authProvider.user.token,
          cartProvider.carts, cartProvider.totalPrice(), 0)) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }

      setState(() {
        isLoading = true;
      });
    }

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text('Chekout Details'),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // NOTE: LIST ITEM
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Item ',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                Column(
                  children: cartProvider.carts
                      .map((cart) => CheckoutCard(cart))
                      .toList(),
                )
              ],
            ),
          ),
          // NOTE: ADDRESS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: bgColor4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                          height: 40,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_address.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          'Store Location',
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Text(
                          'Your Adress',
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          'Tulungagung',
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          // NOTE: PAYMENT
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: bgColor4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItem()} Items',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2e3141),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                          fontSize: 12, fontWeight: semiBold),
                    ),
                    Text(
                      '${cartProvider.totalPrice()}',
                      style: priceTextStyle.copyWith(
                          fontSize: 12, fontWeight: semiBold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // NOTE: BUTTON
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2e3141),
          ),
          isLoading
              ? Container(
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  child: LoadingButton())
              : Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: defaultMargin),
                  child: TextButton(
                    onPressed: handleCheckout,
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 16),
                    ),
                  ),
                )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
