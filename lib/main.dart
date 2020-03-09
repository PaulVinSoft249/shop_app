import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/cart_provider.dart';
import 'package:my_shop_app/providers/models/models.dart';
import 'package:my_shop_app/providers/orders.dart';
import 'package:my_shop_app/screens/edit_product_screen.dart';
import 'package:my_shop_app/screens/order_screen.dart';
import 'package:my_shop_app/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

import './providers/produsts_provider.dart';
import './screens/product_details.dart';
import './screens/home_screen.dart';
import 'screens/product_cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductsProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: FoodModel()),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        title: 'YUMMIE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.blueGrey[400],
          scaffoldBackgroundColor: Colors.blueGrey[800],
        ),
        home: HomeScreen(),
        routes: {
          ProductDetials.routeName: (context) => ProductDetials(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName:(context) => EditProductScreen(),
        },
      ),
    );
  }
}
