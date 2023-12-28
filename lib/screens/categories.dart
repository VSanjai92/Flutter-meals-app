import 'package:domato/data/dummy_data.dart';
import 'package:domato/screens/meals.dart';
import 'package:domato/widgets/category_grid.dart';
import 'package:flutter/material.dart';
import 'package:domato/models/category.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const  CategoriesScreen({super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal>availableMeals;



  void _Selectcategory(BuildContext context,
      Category category){
    final filteredMeals=availableMeals.where((meal)=>meal.categories.contains(category.id)).toList();

      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx)=> MealsScreen(
              title: category.title,
              meals:filteredMeals,
                onToggleFavorite: onToggleFavorite,
              )));
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
        ),

        children: [
          for(final category in availableCategories)
            CategoryGrid(category: category,
            onSelectcategory:(){
                _Selectcategory(context,category);
            }
            ),

        ],





      );

  }
}
