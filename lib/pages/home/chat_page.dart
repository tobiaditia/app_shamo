import 'package:app_shamo/theme.dart';
import 'package:app_shamo/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      title: Text(
        "Message Support",
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  Widget emptyCart() {
    return Expanded(
        child: Container(
      width: double.infinity,
      color: bgColor3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_help.png',
            width: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Opss No Message Yet!",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "You have never done a transaction",
            style: secondaryTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 44,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Explore Store",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          )
        ],
      ),
    ));
  }

  Widget content() {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 18),
            width: double.infinity,
            color: bgColor3,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                ChatTile(),
                ChatTile(),
                ChatTile(),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [header(), content()],
    );
  }
}
