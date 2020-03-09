import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/cart_provider.dart';
import 'package:my_shop_app/screens/product_cart.dart';
import 'package:my_shop_app/widgets/badge.dart';
import 'package:my_shop_app/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../services/colors.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
          actions: <Widget>[
            Consumer<CartProvider>(
              builder: (context, cart,child) {
                return Badge(
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                  value: cart.itemCount.toString(),
                );
              }
            ),
            PopupMenuButton(
              onSelected: (FilterOptions selected) {
                setState(() {
                  if (selected == FilterOptions.Favorite) {
                    _showOnlyFavorite = true;
                  } else {
                    _showOnlyFavorite = false;
                  }
                });
              },
              tooltip: 'Filter',
              color: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(
                    'Only Favorites',
                    style: TextStyle(color: white),
                  ),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text('All', style: TextStyle(color: white)),
                  value: FilterOptions.All,
                ),
              ],
            ),
          ],
          title: Text(
            'YUMMIE FOODS',
            style: TextStyle(
                color: Colors.blueGrey[700],
                fontSize: 22,
                fontWeight: FontWeight.w700),
          )),
      body: ProductsGrid(_showOnlyFavorite),
    );
  }
}
