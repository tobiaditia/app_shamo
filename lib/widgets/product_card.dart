import 'package:app_shamo/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 278,
      margin: EdgeInsets.only(right: defaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffecedef),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/image_shoes.png',
            width: 215,
            height: 150,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hiking",
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Court Version 2.0",
                  overflow: TextOverflow.ellipsis,
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Rp. 500.000",
                  style: priceTextStyle.copyWith(fontSize: 14,fontWeight: medium),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
