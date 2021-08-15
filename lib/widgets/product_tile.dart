import 'package:app_shamo/models/product_model.dart';
import 'package:app_shamo/pages/home/product_page.dart';
import 'package:app_shamo/theme.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.galleries[0].url,
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
                  product.category.name,
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  product.name,
                  style: priceTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  product.price.toString(),
                  style: priceTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
