import "package:shoping/data/dummy_items.dart";
import "package:shoping/models/category.dart";
import "package:shoping/models/grocery_item.dart";
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";
import "package:shoping/data/categories.dart";


class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  void _saveItem() {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
    Navigator.of(context).pop(GroceryItem(
        name: _name,
        id: DateTime.now().toString(),
        quantity: _quantity,
        category: _selectedCategory!));
    print(_name);
    print(_selectedCategory);
    print(_quantity);
  }

  var _name = "";
  var _selectedCategory = categories[Categories.vegetables];
  var _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Item")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text("name")),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return "Must be between 1 and 50 characters";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _name = newValue!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                          maxLength: 50,
                          initialValue: '1',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                int.tryParse(value) == null ||
                                int.tryParse(value)! <= 0) {
                              return "Must be integer value and grater than 0";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _quantity = int.parse(newValue!);
                          },
                          decoration:
                              const InputDecoration(label: Text("quantity"))),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: [
                            for (final cat in categories.entries)
                              DropdownMenuItem(
                                value: cat.value,
                                child: Row(children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: cat.value.color,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(cat.value.title)
                                ]),
                              )
                          ],
                          onChanged: (e) {
                            setState(() {
                              _selectedCategory = e!;
                            });
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                        child: const Text("Reset")),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: _saveItem, child: const Text("Add Item"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
