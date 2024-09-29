import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/Cart.dart';

class CartsOver extends StatefulWidget {
  const CartsOver({Key? key}) : super(key: key);

  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<CartsOver> {
  @override
  Widget build(context) {
    print("sosos");
    return Scaffold(
      appBar: AppBar(title: const  Text("soso")),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
              itemCount: cart.getAll.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(cart.getAll[i].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cart.remove(cart.getAll[i]);
                      },
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
