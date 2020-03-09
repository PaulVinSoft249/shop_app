import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FoodModel with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  FoodModel({
     this.id,
     this.title,
     this.description,
     this.imageUrl,
     this.price,
    this.isFavorite,
  });

  void isToggled(){
    isFavorite = !isFavorite;
    notifyListeners();
  }


}
