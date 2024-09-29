import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/carts.dart';
import 'package:provider_app/model/Cart.dart';
import './model/Item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Items> items = [
    Items(name: "s22 ultra", price: 500),
    Items(name: "iphone 13 pro max", price: 600),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        actions: [
          Row(children: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const CartsOver();
            }));
          }, icon: const Icon(Icons.shopping_cart,color: Colors.white,)),
          Container(margin:const  EdgeInsets.fromLTRB(0, 0, 10, 10),child:  Text("${context.watch<Cart>().totalItem}",style: TextStyle(color: Colors.white,fontSize: 10),))

          ],)
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text(items[i].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart_outlined),
                    onPressed: ()  {
                      context.read<Cart>().add(items[i]);
                    }
                  ),
                ),
              );
            }),
      ),
    );
  }
}
