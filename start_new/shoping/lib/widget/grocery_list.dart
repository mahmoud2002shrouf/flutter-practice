import "package:flutter/material.dart";
import "package:shoping/data/dummy_items.dart";
import "package:shoping/models/grocery_item.dart";
import "package:shoping/widget/new_item.dart";
class GroceryList extends StatefulWidget{
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> items=[...groceryItems];
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(title: const Text("List Grocery"),actions: [IconButton(onPressed: ()async{

       final res=await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const NewItem()));
       setState(() {
         items.add(res);
       });

      }, icon:const  Icon(Icons.add))],),
      body: ListView.builder(itemCount: items.length,itemBuilder: (ctx,index)=>Dismissible(
        key: Key(items[index].name),
        onDismissed: (direction){
          items.remove(items[index]);
        },
        child: ListTile(
          title: Text(items[index].name),
          //قبلة
          leading: Container(width: 24,height: 24,color: items[index].category.color,),
          //بعده
         trailing : Text(items[index].quantity.toString()),
        ),
      )),
    );
  }
}