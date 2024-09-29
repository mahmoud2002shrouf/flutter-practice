import 'dart:io';

import 'package:advanies_app/controller/place_controler.dart';
import 'package:advanies_app/view/Home.dart';
import 'package:advanies_app/widget/add_img.dart';
import 'package:advanies_app/widget/location_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlace extends StatelessWidget {
  const AddPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlacesController PlaceCon = Get.find();
    final _TitleConteroler = TextEditingController();
    File? _selectedImg;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration:
                  const InputDecoration(labelText: 'input the name of place'),
              controller: _TitleConteroler,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            AddImg(
              onTakeImage: (image) {
                _selectedImg = image;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const LocationInput()
            ,
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () {
                PlaceCon.addPlace(_TitleConteroler.text,_selectedImg!);
                Get.back();
              },
              label: const Text("Add"),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
