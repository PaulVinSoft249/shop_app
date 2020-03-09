import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_shop_app/providers/orders.dart';
import 'package:my_shop_app/screens/order_screen.dart';
import 'package:my_shop_app/services/colors.dart';
import '../providers/cart_provider.dart' show CartProvider;
import 'package:provider/provider.dart';
import '../widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MY CART'),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (context, i) {
                      return CartItems(
                        cart.cartItem.values.toList()[i].id,
                        cart.cartItem.keys.toList()[i],
                        cart.cartItem.values.toList()[i].title,
                        cart.cartItem.values.toList()[i].imageUrl,
                        cart.cartItem.values.toList()[i].quantity,
                        cart.cartItem.values.toList()[i].price,
                      );
                    }),
              ),
              
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[800],
        child: Container(
          height: 90,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GRAND TOTAL',
                      style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$${cart.totalAmount.toString()}',
                      style: TextStyle(color: Colors.grey[400], fontSize: 35),
                    ),
                  ],
                ),
              ),
              ButtonTheme(
                minWidth: 350,
                child: FlatButton(
                  color: Colors.orange,
                  child: Text(
                    'PLACE ORDER',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(cart.cartItem.values.toList(), cart.totalAmount);
                    Navigator.of(context).pushNamed(OrderScreen.routeName);

                    cart.clearCart();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
