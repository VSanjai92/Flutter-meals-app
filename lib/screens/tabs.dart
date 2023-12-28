import 'package:domato/screens/categories.dart';
import 'package:domato/screens/filters.dart';
import 'package:domato/screens/meals.dart';
import 'package:domato/widgets/main_drawer.dart';
import 'package:domato/data/dummy_data.dart';
import 'package:domato/providers/meals_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};


class TabScreen extends ConsumerStatefulWidget{
  const TabScreen({super.key});


  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {

  int _selectedPageIndex =0;

  final List<Meal> _favoriteMeals=[];
  Map<Filter,bool>_selectedFilters=kInitialFilters;

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
          Text(message),
      ),
    );
  }


  void _toggleMealFavoriteStatus (Meal meal){
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting)
    {
      setState(() {
        _favoriteMeals.remove(meal);
      });
    _showInfoMessage('Meal is no longer favorite');
    }
    else
      {
        setState(() {
          _favoriteMeals.add(meal);
        });
        _showInfoMessage('Meal is marked as favorite');
      }

  }



  void _selectPage(int index){
    setState(() {
      _selectedPageIndex= index;
    });
  }
  void _setScreen(String Identifier) async{
      Navigator.of(context).pop();
    if (Identifier == 'Filters') {
      final result = await Navigator.of(context).push<Map<Filter,bool>>
        (MaterialPageRoute(builder: (ctx)=>  FilterScreen(currentFilters: _selectedFilters,),),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });

    }


  }
  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(MealsProvider);
    final availableMeals= meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();







    Widget activePage=  CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if(_selectedPageIndex==1){
      activePage = MealsScreen(
          meals:_favoriteMeals,
        onToggleFavorite:_toggleMealFavoriteStatus,
      );
      activePageTitle='Your Favorites';
    }
    
    return  Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer:MainDrawer( OnSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,

        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal,),label:'categories' ),
              BottomNavigationBarItem(icon: Icon(Icons.star,),label:'favorites'),

      ],

      ),
    );
  }
}
