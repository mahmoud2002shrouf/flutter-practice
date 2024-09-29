import 'package:advanies_app/controller/place_controler.dart';
import 'package:advanies_app/view/add_place.dart';
import 'package:advanies_app/view/place_des.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Place"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const AddPlace());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(child: GetBuilder<PlacesController>(
        builder: (MyPlace) {
          return ListView.builder(
              itemCount: MyPlace.getplases.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        minVerticalPadding: 16,
                        leading: CircleAvatar(radius: 30,backgroundImage: FileImage(MyPlace.getplases[i].image),),
                        title: Text(MyPlace.getplases[i].title),
                        onTap: () {
                          Get.to(() => PlaceDes(place: MyPlace.getplases[i]));
                        },
                      ),
                    ),
                  ),
                );
              });
        },
      )),
    );
  }
}
