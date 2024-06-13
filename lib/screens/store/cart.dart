import 'package:fitness/components/color_dot.dart';
import 'package:fitness/components/count_selector.dart';
import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/price_text.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/product.dart';
import 'package:fitness/screens/store/product_detail.dart';
import 'package:fitness/screens/store/select_place.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> productList = [];
  @override
  void initState() {
    super.initState();
    productList = [
      Product(
        img: "assets/images/Photo1.png",
        name: 'Gym Monster',
        description: 'Little description for this product',
        price: 69.99,
      ),
      Product(
        img: "assets/images/Photo1.png",
        name: 'Gear For Fitness',
        description: 'Little description for this product',
        price: 120.00,
      ),
      Product(
        img: "assets/images/Photo1.png",
        name: 'Sport Kit',
        description: 'Little description for this product',
        price: 39.99,
      ),
      Product(
        img: "assets/images/Photo1.png",
        name: 'Gym Monster',
        description: 'Little description for this product',
        price: 69.99,
      ),
      Product(
        img: "assets/images/Photo1.png",
        name: 'Training Gear',
        description: 'Little description for this product',
        price: 55.99,
      ),
      Product(
        img: "assets/images/Photo1.png",
        name: 'Gym Kit',
        description: 'Little description for this product',
        price: 65.75,
      ),
    ];
  }

  void navProductDetail(BuildContext context) {
    navPush(context, ProductDetailScreen());
  }

  Widget _buildProductCard(BuildContext context, int index) {
    Product product = productList[index];
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.only(left: 8, top: 8),
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product.img!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFD0021B),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: textColor.withOpacity(0.2),
                        offset: Offset(2, 2),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Container(width: 8, height: 3, color: white),
                ),
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: BlackText(product.name, 14, true),
                            ),
                            Row(
                              children: [
                                PrimaryText('Blue', 12),
                                SizedBox(width: 6),
                                DoubleColorDot(
                                  size: 12,
                                  borderWidth: 1,
                                  color: primaryColor,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 4),
                        PriceText(
                          mainText: product.price.toString(),
                          mainStyle:
                              TextStyle(color: primaryColor, fontSize: 14),
                          subText: ' SAR',
                          subStyle: TextStyle(color: primaryColor, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 70),
            CountSelector(),
            Expanded(child: SizedBox(width: 1)),
            SizedBox(
              width: 130,
              height: 28,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  alignment: Alignment.center,
                  color: secondaryColor.withOpacity(.15),
                  child: SecondaryText('Shopping Similar', 12, true),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 16),
        Divider(height: 1),
        SizedBox(height: 12),
      ],
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'shopping cart',
      child: Column(children: [
        Expanded(
          child: Container(
            width: getWindowWidth(context),
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, index);
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        PrimaryBlockButton(
          label: 'Process to Checkout',
          action: () => navPush(context, SelectPlaceScreen()),
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}
