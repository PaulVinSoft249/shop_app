import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop_app/providers/cart_provider.dart';
import 'package:my_shop_app/providers/models/models.dart';
import 'package:my_shop_app/screens/product_details.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodModelProvider = Provider.of<FoodModel>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Card(
      elevation: 2.0,
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetials.routeName,
              arguments: foodModelProvider.id,
            );
          },
          child: Image.asset(
            foodModelProvider.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Theme.of(context).accentColor.withOpacity(.7),
            padding: const EdgeInsets.only(left: 0),
            height: 35,
            width: 40,
            child: Consumer<FoodModel>(builder: (context, prodProvider, child) {
              return IconButton(
                icon: prodProvider.isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      )
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  prodProvider.isToggled();
                },
              );
            }),
          ),
        ),
        footer: Container(
          height: 48,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(foodModelProvider.title),
            subtitle: Text('\$${foodModelProvider.price.toString()}'),
            trailing: IconButton(
              iconSize: 23,
              icon: Icon(
                Icons.add_shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                cartProvider.addItem(
                    foodModelProvider.id,
                    foodModelProvider.price,
                    foodModelProvider.title,
                    foodModelProvider.imageUrl);
                Fluttertoast.showToast(
                  msg:
                      "Added ${foodModelProvider.title.toUpperCase()} to cart ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.orange,
                  textColor: Colors.blueGrey[900],
                  fontSize: 16.0,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
