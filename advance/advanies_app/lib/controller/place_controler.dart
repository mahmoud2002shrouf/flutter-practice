import 'dart:io';

import 'package:advanies_app/model/palce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PlacesController extends GetxController{
  List<Place> Allplace=[];
  void addPlace(String place,File img){
    Allplace.add(Place(title: place,image: img));
    update();
  }
  List<Place> get getplases =>Allplace;
}