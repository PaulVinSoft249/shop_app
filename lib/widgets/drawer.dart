import 'package:flutter/material.dart';
import 'package:my_shop_app/screens/order_screen.dart';
import 'package:my_shop_app/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: Text('Shop'),
                leading: Icon(Icons.shopping_basket),
                onTap: (){
                  Navigator.of(context).pushNamed(OrderScreen.routeName);
                },
              ),
              ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
            ],
          ),
        ],
      ),
    );
  }
}
