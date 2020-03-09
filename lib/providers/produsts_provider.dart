import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './models/models.dart';

class ProductsProvider with ChangeNotifier {
  List<FoodModel> _items = [
    FoodModel(
      id: 'p0',
      title: 'Pizza',
      imageUrl: 'assets/pizza.jpg',
      description: 'Pizza is nice',
      price: 10.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p1',
      title: 'Burger',
      imageUrl: 'assets/burger.png',
      description: 'Burger is nice and appitizing',
      price: 20.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p2',
      title: 'Ice Cream',
      imageUrl: 'assets/ice.jpg',
      description: 'Ice Cream really is nice try it out',
      price: 120.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p3',
      title: 'Fried Rice & Chicken',
      imageUrl: 'assets/chickNfried.jpg',
      description: 'Fried and chicken is nice and ideal for strength',
      price: 130.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p4',
      title: 'Fried Chicken',
      imageUrl: 'assets/friedchick.jpg',
      description: 'Fried Chicken is nice, Hmmmmm yummy.,',
      price: 180.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p5',
      title: 'Roasted Chicken',
      imageUrl: 'assets/roasted_chicken.jpg',
      description: 'Roasted chicken has always been our customer choice.',
      price: 139.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p7',
      title: 'Pizza',
      imageUrl: 'assets/pizza.jpg',
      description: 'Pizza is nice',
      price: 10.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p8',
      title: 'Roasted Chicken',
      imageUrl: 'assets/roasted_chicken.jpg',
      description: 'Roasted chicken has always been our customer choice.',
      price: 139.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p9',
      title: 'Fried Chicken',
      imageUrl: 'assets/friedchick.jpg',
      description: 'Fried Chicken is nice, Hmmmmm yummy.,',
      price: 180.0,
      isFavorite: false,
    ),
    FoodModel(
      id: 'p10',
      title: 'Ice Cream',
      imageUrl: 'assets/ice.jpg',
      description: 'Ice Cream really is nice try it out',
      price: 120.0,
      isFavorite: false,
    ),
  ];

  var _showFavorite = false;

  List<FoodModel> get items {
    // if(_showFavorite ){
    //   return _items.where((prodItem)=> prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<FoodModel> get onlyFavorite {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  void addProduct(FoodModel products) {
    const url = 'https://myshopapp-c7250.firebaseio.com/products.json';
    http
        .post(url,
            body: json.encode({
              'title': products.title,
              'description': products.description,
              'imageUrl': products.imageUrl,
              'price': products.price,
              'isFavorite': products.isFavorite,
            })) 
        .then((response) {
          print('${json.decode(response.body)}');
      final newProduct = FoodModel(
        title: products.title,
        description: products.description,
        price: products.price,
        imageUrl: products.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    });
  }

  void updateProduct(String id, FoodModel newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  // void showFavoritesOnly(){
  //   _showFavorite = true;
  //   notifyListeners();

  // }
  // void showAll(){
  //   _showFavorite = false;
  //   notifyListeners();

  // }

  FoodModel findById(String id) {
    return _items.firstWhere((prodId) => prodId.id == id);
  }
}
