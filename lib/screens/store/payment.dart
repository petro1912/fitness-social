import 'package:fitness/components/credit_card.dart';
import 'package:fitness/components/credit_card_create.dart';
import 'package:fitness/components/credit_card_input.dart';
import 'package:fitness/components/credit_text.dart';
import 'package:fitness/components/invoice_card.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/price_text.dart';
import 'package:fitness/components/radio_group.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/data/string.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildInvoiceMain() {
    List invoiceItems = [
      ['Subtotal', 24.99],
      ['Shipping Fee', 2.99],
      ['VAT', 3.0],
    ];
    return List.generate(
      invoiceItems.length,
      (index) =>
          _buildInvoiceItem(invoiceItems[index][0], invoiceItems[index][1]),
    );
  }

  Widget _buildInvoiceItem(String text, double price) {
    print(price);
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlackText(text, 14, true),
          PriceText(
            mainText: price.toStringAsFixed(2),
            mainStyle:
                TextStyle(fontWeight: Bold, fontSize: 14, color: textColor),
            subText: ' SAR',
            subStyle: TextStyle(fontSize: 9, color: textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceTotal(String text, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrimaryText(text, 16, true),
        PriceText(
          mainText: price.toStringAsFixed(2),
          mainStyle:
              TextStyle(fontWeight: Bold, fontSize: 16, color: primaryColor),
          subText: ' SAR',
          subStyle: TextStyle(fontSize: 11, color: primaryColor),
        ),
      ],
    );
  }

  void placeOrder() {}

  @override
  Widget build(BuildContext context) {
    return MainResponsiveScaffold(
      title: 'payment',
      child: Column(
        children: [
          Padding(
            padding: mainHrPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackText(strStorePaymentPl, 14, true),
                GreyText(strStorePayPackagePl, 12),
                Divider(),
                SizedBox(height: 16),
                RadioGroup(groupItems: [
                  GroupItem(name: 'Pay with Card', icon: 'pay-card'),
                  GroupItem(name: 'Pay with Apple Pay', icon: 'pay-apple'),
                  GroupItem(name: 'Pay with Cash', icon: 'pay-cash'),
                ]),
              ],
            ),
          ),
          SizedBox(height: 6),
          Container(
            height: 260,
            child: PageView(
              controller: _controller,
              children: [
                CreditTextView(),
                CreditCardView(),
                CreditCardCreate(),
                CreditCardInput(),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: mainHrPadding,
            child: InvoiceCard(
              height: 180,
              mainChild: Column(
                children: _buildInvoiceMain(),
              ),
              totalChild: _buildInvoiceTotal('Total', 30),
            ),
          ),
          SizedBox(height: 20),
          PrimaryBlockButton(
            label: 'Place Order',
            action: () => placeOrder(),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
