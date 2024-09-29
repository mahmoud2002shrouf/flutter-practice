import 'package:advanies_app/model/palce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceDes extends StatelessWidget {
  const PlaceDes({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title),),
      body: Stack(children: [Image.file(place.image,fit: BoxFit.cover,width: double.infinity,height: double.infinity,)],)
    );
  }
}
