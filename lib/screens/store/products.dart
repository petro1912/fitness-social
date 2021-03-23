import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/price_text.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/product.dart';
import 'package:fitness/screens/store/product_detail.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key key, this.title}) : super(key: key);
  final String title;

  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
    return InkWell(
      onTap: () => navProductDetail(context),
      child: Column(
        children: [
          SizedBox(height: 16),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product.img),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                            blackText(product.name, 14, true),
                            SizedBox(height: 4),
                            greyText(getSubstring(product.description, 30), 12),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      PriceText(
                        mainText: product.price.toString(),
                        mainStyle: TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        subText: ' SAR',
                        subStyle: TextStyle(color: primaryColor, fontSize: 8),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 12),
          Divider(height: 1),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainScaffold(
      title: widget.title ?? '',
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
    );
  }
}
