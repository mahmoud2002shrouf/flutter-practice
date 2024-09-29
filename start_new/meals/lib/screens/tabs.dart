import "package:flutter/material.dart";
import "package:meals/screens/categories.dart";
import "package:meals/screens/drawer.dart";
import "package:meals/screens/filter.dart";
import "package:meals/screens/meals.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:meals/provider/faverit_provider.dart";
import 'package:meals/provider/filter_provider.dart';


class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});
  @override
  ConsumerState<Tabs> createState() {
    return _Tabs();
  }
}

class _Tabs extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;
  



  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelect(String text) async{
    Navigator.of(context).pop();

    if (text == "Filter") {
     await Navigator.of(context)
          .push<Map<Filter,bool>>(MaterialPageRoute(builder: (ctx) =>  const FilterScreen())); 
         
    }
  }

  @override
  Widget build(BuildContext context) {
   
    
    Widget activePag = CategoriesScreen(
      meals: ref.watch(filterData),
    );
    String activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePag = Meals( meals: ref.watch(favoritProvider));
      activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: DrawerScreen(onSelect: onSelect),
      body: activePag,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _selectedPage(index);
          },
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          ]),
    );
  }
}
