import "package:device_app/module/place_item.dart";
import "package:device_app/page/form.dart";
import "package:device_app/widget/place_item.dart";
import "package:flutter/material.dart";

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  final List<PlaceItem> _places = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Place"),
          actions: [
            IconButton(
                onPressed: () async {
                  final res = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FormData()));
                  if (res == null) {
                    return;
                  }
                  setState(() {
                    _places.add(res);
                  });
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: _places.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(
                  _places[index].title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PlaceItems( title:_places[index].title )));
                },
              );
            })));
  }
}
