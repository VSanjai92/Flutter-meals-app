import 'package:domato/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:domato/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key, required this.currentFilters});

  final Map<Filter,bool>currentFilters;

  State<FilterScreen> createState() => _FilterScreenState();

}

class _FilterScreenState extends State <FilterScreen> {
  var _glutenfreefilterset = false;
  var _lactosefreefilterset = false;
  var _vegetarianfilterset = false;
  var _veganfilterset = false;

 @override
  void initState() {
    super.initState();
    _glutenfreefilterset = widget.currentFilters[Filter.glutenFree]!;
    _lactosefreefilterset =  widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianfilterset =  widget.currentFilters[Filter.vegetarian]!;
    _veganfilterset =  widget.currentFilters[Filter.vegan]!;

  }


  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your filters'),
        ),

        /*drawer: MainDrawer(
        OnSelectScreen:(identifier){
          Navigator.of(context).pop();
          if(identifier=='meals_provider.dart'){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (ctx)=>const TabScreen()));
          }
        }
      ),*/



     body: WillPopScope(
       onWillPop: () async {
         Navigator.of(context).pop({
           Filter.glutenFree: _glutenfreefilterset,
           Filter.lactoseFree: _lactosefreefilterset,
           Filter.vegetarian:_vegetarianfilterset,
           Filter.vegan: _veganfilterset,
         });
         return false;
       },
       child: Column(
          children: [
            SwitchListTile(
              value: _glutenfreefilterset,
              onChanged: (isChecked) {
                setState(() {
                  _glutenfreefilterset = isChecked;
                });
              },
              title: Text('Gluten-free', style:
              Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
              ),
              subtitle: Text('only include gluten-free meals.dart',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),

            ),
            SwitchListTile(
              value: _lactosefreefilterset,
              onChanged: (isChecked) {
                setState(() {
                  _lactosefreefilterset = isChecked;
                });
              },
              title: Text('lactose-free', style:
              Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
              ),
              subtitle: Text('only include lactose-free meals.dart',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),

            ),
            SwitchListTile(
              value: _vegetarianfilterset,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianfilterset = isChecked;
                });
              },
              title: Text('vegetarian', style:
              Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
              ),
              subtitle: Text('only include vegetarian meals.dart',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),

            ),
            SwitchListTile(
              value: _veganfilterset,
              onChanged: (isChecked) {
                setState(() {
                  _veganfilterset = isChecked;
                });
              },
              title: Text('vegan', style:
              Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,
              ),
              ),
              subtitle: Text('only include vegan meals.dart',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onBackground,
                ),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),

            ),
          ],
        ),
     ),

    );

  }
  }

