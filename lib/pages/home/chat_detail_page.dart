import 'package:app_shamo/theme.dart';
import 'package:app_shamo/widgets/chat_buble.dart';
import 'package:flutter/material.dart';

class DetailChatPage extends StatelessWidget {
  Widget appbar() {
    return PreferredSize(
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/image_chat_online.png',
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shoe Store",
                    style: primaryTextStyle.copyWith(
                        fontWeight: medium, fontSize: 14),
                  ),
                  Text(
                    "Shoe Store",
                    style: secondaryTextStyle.copyWith(
                        fontWeight: light, fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70));
  }

  Widget productPreview() {
    return Container(
      width: 225,
      height: 74,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor5,
          border: Border.all(color: primaryColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 54,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Court Vision II",
                  style: primaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Rp. 500.000",
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/icon_close_message.png',
            width: 22,
          )
        ],
      ),
    );
  }

  Widget chatInput() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productPreview(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: bgColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: "Type Message ...",
                        hintStyle: subtitleTextStyle),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/icon_send_message.png',
                width: 45,
                height: 45,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget content() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        ChatBuble(
          text: 'Hi, this product alredy ?',
          isSender: true,
          hasProduct: true,
        ),
        ChatBuble(
          text: 'Ready',
          isSender: false,
        ),
        ChatBuble(
          text: 'Ok, I will Order this Product',
          isSender: true,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: appbar(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
