import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/produsts_provider.dart';

import '../widgets/product_item.dart';
class ProductsGrid extends StatelessWidget {

  final bool showFavorite;
  ProductsGrid(this.showFavorite);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final products =  showFavorite ? productProvider.onlyFavorite : productProvider.items;
      return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 2 / 2.4,
        ),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        ),
      );
  }
}