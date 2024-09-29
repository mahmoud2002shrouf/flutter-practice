import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider_app/model/Item.dart';
class Cart with ChangeNotifier{
  final List<Items> _item =[];
  double _price=0.0;
  void add(Items item){
    _item.add(item);
    _price+=item.price;
    notifyListeners();
  }
    void remove(Items item){
    _item.remove(item);
    _price-=item.price;
    notifyListeners();
  }
  int get totalItem{
    return _item.length;
  }
  double get totalPrice{
    return _price;
  }
  List<Items> get getAll{
    return _item;
  }


}