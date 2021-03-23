import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/components/color_selector.dart';
import 'package:fitness/components/count_selector.dart';
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
  int _currentImageIndex = 0;
  Product product;

  List<Widget> _buildProductImages() {
    return List.generate(
      product.images.length,
      (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          image: DecorationImage(
              image: AssetImage(product.images[index]), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildProCarouselBullets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        product.images.length,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentImageIndex == index
                ? secondaryColor
                : secondaryColor.withOpacity(.5),
          ),
        ),
      ),
    );
  }

  Widget _buildProImageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          setState(() {
            _currentImageIndex = index;
          });
        },
      ),
      items: _buildProductImages(),
    );
  }

  void initState() {
    product = Product(
      name: 'Name of Product',
      description: '',
      price: 45.99,
      images: [
        'assets/images/club-item1.png',
        'assets/images/club-item2.png',
        'assets/images/club-item3.png',
        'assets/images/club-item1.png',
        'assets/images/club-item2.png',
        'assets/images/club-item3.png',
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
          _buildProImageSlider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    greyText('Company', 12),
                    _buildProCarouselBullets(),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    blackText('Name of this Product', 24, true),
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                greyText('Other Products', 12),
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
                      image: AssetImage(product.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
