import 'package:app_shamo/theme.dart';
import 'package:app_shamo/widgets/product_card.dart';
import 'package:app_shamo/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo Tobi',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@tobi',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icon_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Text(
                  'All Shoes',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget popularProductTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, right: defaultMargin, left: defaultMargin),
        child: Text("Popular",
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold)),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, right: defaultMargin, left: defaultMargin),
        child: Text("New Arrivals",
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold)),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
            children: [
              ProducTile(),
              ProducTile(),
              ProducTile(),
            ],
        ),
      );
    }

    return ListView(children: [
      header(),
      categories(),
      popularProductTitle(),
      popularProduct(),
      newArrivalsTitle(),
      newArrivals(),
    ]);
  }
}
