import 'dart:async';

import 'package:flutter/material.dart';

Stream<MyModel> someAsynic()  {
  return Stream<MyModel>.periodic(
       Duration(seconds: 1), (x) => MyModel(someValue: '$x')).take(10);
}

class MyModel  {
  MyModel({required this.someValue});
  String someValue = "hello";
 void doSomeThing() async {
    someValue = 'goodbay';
    print(someValue);
  }
}
