import 'package:app_shamo/theme.dart';
import 'package:flutter/material.dart';

class WishlistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image_shoes.png',
                width: 60,
              )),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terrex Urban Low",
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Rp. 500.000",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/button_wishlist_blue.png',
            width: 24,
          )
        ],
      ),
    );
  }
}
