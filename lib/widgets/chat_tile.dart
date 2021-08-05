import 'package:app_shamo/theme.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image_chat.png',
                  width: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shoe Store",
                        style: primaryTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        "Alredy ? Are You ready to buy this shoes ?",
                        style: secondaryTextStyle.copyWith(fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "2 day ago",
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: Color(0xff282939),
            )
          ],
        ),
      ),
    );
  }
}
