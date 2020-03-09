import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop_app/services/colors.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final String imageUrl;
  final int quantity;
  final double price;

  CartItems(
    this.id,
    this.productId,
    this.title,
    this.imageUrl,
    this.quantity,
    this.price,
  );
  @override
  Widget build(BuildContext context) {
    print(title.toString());
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
        Fluttertoast.showToast(
            msg: '${title.toUpperCase()} removed from cart',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      background: Container(
        color: Colors.orange,
        child: Icon(
          Icons.delete,
          size: 50,
          color: Colors.blueGrey[900],
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.all(5),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  elevation: 10,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    height: 95,
                    width: 90,
                    child: Image.asset(
                      imageUrl.toString(),
                      fit: BoxFit.cover,
                      scale: 7,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      'Total: \$${(price * quantity)}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer(),
            Expanded(
              flex: 1.5.round(),
              child: Column(
                children: <Widget>[
                  Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 18,
                    ),
                    onPressed: () {},
                  )),
                  Container(
                    height: 30,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: Center(
                      child: Text(
                        '$quantity x',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 18,
                    ),
                    onPressed: () {},
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
