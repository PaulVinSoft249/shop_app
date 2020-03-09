import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop_app/providers/cart_provider.dart';
import 'package:my_shop_app/providers/models/models.dart';
import 'package:my_shop_app/screens/product_cart.dart';
import 'package:my_shop_app/services/colors.dart';
import 'package:my_shop_app/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../providers/produsts_provider.dart';

class ProductDetials extends StatelessWidget {
  static const routeName = '/ProductDetials';
  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<FoodModel>(context, listen: true);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId);

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
          title: Text('Yummie Foods'),
          centerTitle: true,
          actions: <Widget>[
            Consumer<CartProvider>(builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Badge(
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: Colors.blueGrey[800],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                  value: cart.itemCount.toString(),
                ),
              );
            }),
          ]),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loadedProduct.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey[900].withOpacity(.6),
            ),
            Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      color: white,
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey[400],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.chat_bubble_outline,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '45',
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    loadedProduct.title,
                                    style: TextStyle(
                                        color: Colors.orange[900],
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    loadedProduct.description,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blueGrey[900],
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                '\$${loadedProduct.price.toString()}',
                                style: TextStyle(
                                    color: Colors.grey[200], fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ButtonTheme(
                            height: 100,
                            child: RaisedButton(
                              elevation: 8,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_shopping_cart,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Add to cart',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ]),
                              onPressed: () {
                                cartProvider.addItem(
                                  loadedProduct.id,
                                  loadedProduct.price,
                                  loadedProduct.title,
                                  loadedProduct.imageUrl,
                                );
                                Fluttertoast.showToast(
                                    msg:
                                        "Added ${loadedProduct.title.toUpperCase()} to cart ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.orange,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 50,
              left: 15,
              right: 15,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 10,
                          color: Colors.blueGrey[900].withOpacity(.5),
                          blurRadius: 10,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(loadedProduct.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(200.0),
                        topRight: const Radius.circular(200.0),
                        bottomRight: const Radius.circular(200.0),
                        bottomLeft: const Radius.circular(200.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
