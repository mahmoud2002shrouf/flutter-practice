import "package:flutter/material.dart";
import "package:meals/models/meal.dart";
import "package:meals/screens/meal_details.dart";
import "package:meals/widget/meal_item_trait.dart";
import "package:transparent_image/transparent_image.dart";

class MailItem extends StatelessWidget {
  const MailItem({super.key, required this.meal});
  final Meal meal;

  String get comText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }
    String get affText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }
  void _selectedMeal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealDetails(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){_selectedMeal(context);},
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: const Color.fromARGB(175, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaelItemTrait(
                              lable: '${meal.duration} min',
                              icon: Icons.schedule),
                          const SizedBox(
                            width: 12,
                          ),
                          MaelItemTrait(lable: comText, icon: Icons.work_history_outlined),
                          const SizedBox(
                            width: 12,
                          ),
                          MaelItemTrait(lable: affText, icon: Icons.attach_money)
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
