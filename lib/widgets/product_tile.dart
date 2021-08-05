import 'package:app_shamo/theme.dart';
import 'package:flutter/material.dart';

class ProducTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: defaultMargin, left: defaultMargin, bottom: defaultMargin),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Football",
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Predator 20.3 Firm Ground",
                style:
                    priceTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Rp. 500.000",
                style: priceTextStyle.copyWith(fontWeight: medium),
              )
            ],
          ))
        ],
      ),
    );
  }
}
