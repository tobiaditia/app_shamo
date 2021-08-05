import 'package:app_shamo/theme.dart';
import 'package:app_shamo/widgets/whislist_card.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Wishlist",
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: bgColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_favourite.png',
              width: 74,
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "You don't have dream shoes ?",
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Let's find your favourite shoes",
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: Text(
                  "Explore Store",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      ));
    }


    Widget content() {
      return Expanded(child: Container(
        color: bgColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            WishlistCard(),
            WishlistCard(),
            WishlistCard(),
          ],
        ),
      ));
    }

    return Column(
      children: [header(), content()],
    );
  }
}
