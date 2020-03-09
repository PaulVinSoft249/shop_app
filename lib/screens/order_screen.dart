import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/orders.dart';
import 'package:my_shop_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context,listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItemWidget(
          orderData.orders[i],
        ),
      ),
    );
  }
}
