import 'package:app_shamo/models/product_model.dart';
import 'package:app_shamo/providers/product_provider.dart';
import 'package:app_shamo/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;

  ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;
  bool isWishlist = false;
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: widget.product.price);

    MoneyFormatterOutput fo = fmf.output;

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? primaryColor : Color(0xffc4c4c4)),
      );
    }

    Widget familiarImagesWidget(String imageUrl) {
      return Container(
        margin: EdgeInsets.only(right: 16),
        width: 54,
        height: 54,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(image: NetworkImage(imageUrl))),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.chevron_left)),
                Icon(
                  Icons.shopping_bag,
                  color: bgColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
              items: widget.product.galleries
                  .map((image) => Image.network(
                        image.url,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      int indexFamiliarImages = -1;

      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: bgColor1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Text(
                          widget.product.category.name,
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                        if (isWishlist) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: secondaryColor,
                              content: Text(
                                'Has been added to the Wishlist',
                                textAlign: TextAlign.center,
                              )));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: alertColor,
                              content: Text(
                                'Has been removed from the Wishlist',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      });
                    },
                    child: Image.asset(
                      isWishlist
                          ? 'assets/button_whislist_blue.png'
                          : 'assets/button_whislist_gray.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Harga",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "Rp. " + fo.withoutFractionDigits,
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "Familiar Shoes",
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: productProvider.products.map((product) {
                        indexFamiliarImages++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: indexFamiliarImages == 0
                                    ? defaultMargin
                                    : 0,
                                right: indexFamiliarImages ==
                                        productProvider.products.length - 1
                                    ? 14
                                    : 0),
                            child:
                                familiarImagesWidget(product.galleries[0].url));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/button_chat.png'))),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: Text(
                          "Add to Cart",
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color(0xffecedef),
        body: ListView(
          children: [header(), content()],
        ));
  }
}
