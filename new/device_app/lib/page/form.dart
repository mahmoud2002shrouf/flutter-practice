import "package:device_app/module/place_item.dart";
import "package:device_app/page/all_pages.dart";
import "package:flutter/material.dart";

class FormData extends StatefulWidget {
  const FormData({super.key});
  @override
  State<FormData> createState() => _FormData();
}

class _FormData extends State<FormData> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  void saveDate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pop(
        PlaceItem(id: DateTime.now().toString(), title: _enteredTitle),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextFormField(
              maxLength: 50,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length > 50) {
                  return 'Must be between 1 and 50 characters.';
                }
                return null;
              },
              decoration: const InputDecoration(label: Text("title")),
              onSaved: (value) {
                _enteredTitle = value!;
              },
            ),
            ElevatedButton.icon(
                onPressed: () {
                  saveDate();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "add place",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                )),
          ]),
        ),
      ),
    );
  }
}
