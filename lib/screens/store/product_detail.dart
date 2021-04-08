import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/components/color_selector.dart';
import 'package:fitness/components/count_selector.dart';
import 'package:fitness/components/image_slider.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/price_text.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/product.dart';
import 'package:fitness/screens/store/cart.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product product;

  void initState() {
    product = Product(
      name: 'Name of Product',
      description: '',
      price: 45.99,
      images: [
        'club-item1',
        'club-item2',
        'club-item3',
        'club-item1',
        'club-item2',
        'club-item3',
      ],
    );
    super.initState();
  }

  void addToCart(BuildContext context) {
    navPush(context, CartScreen());
  }

  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: '',
      child: Column(
        children: [
          ImageSlider(
            images: product.images,
            // dotColor: primaryColor,
            titleText: GreyText('Company', 12),
          ),
          Container(
            padding: mainHrPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlackText('Name of this Product', 24, true),
                    PriceText(
                      mainText: product.price.toString(),
                      mainStyle: TextStyle(color: primaryColor, fontSize: 16),
                      subText: ' SAR',
                      subStyle: TextStyle(color: primaryColor, fontSize: 10),
                    )
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 28,
                        child: ColorSelector(),
                      ),
                    ),
                    CountSelector(),
                  ],
                ),
                SizedBox(height: 12),
                GreyText('Other Products', 12),
                SizedBox(height: 12),
              ],
            ),
          ),
          Container(
            height: 80,
            margin: EdgeInsets.only(left: 30),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: product.images.length,
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: getAssetImage(product.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: mainHrPadding,
            child: SizedBox(
              width: double.infinity,
              child: RoundedRaisedButton(
                label: 'Add to Cart',
                filled: true,
                action: () => addToCart(context),
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
