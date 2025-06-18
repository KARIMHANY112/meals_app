import 'package:flutter/material.dart';
//import 'package:meals/screens/tabs.dart';
//import 'package:meals/widgets/main_drawer.dart';

enum Filter {
   glutenFree,
   lactoseFree,
   vegan,
   vegetarian,
}

class FiltersScreen extends StatefulWidget{

  const FiltersScreen ({super.key,required this.currentFilters});

  final Map<Filter,bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
 return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet=false;
  var _LactoseFreeFilterSet=false;
  var _VegetrianFilterSet=false;
  var _VeganFilterSet=false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeFilterSet= widget.currentFilters[Filter.glutenFree]!;
  _LactoseFreeFilterSet=widget.currentFilters[Filter.lactoseFree]!;
   _VegetrianFilterSet=widget.currentFilters[Filter.vegetarian]!;
   _VeganFilterSet=widget.currentFilters[Filter.vegan]!;
  }


  @override    
  Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
 title: const Text('your Filters'),

),
//drawer: MainDrawer(onSelectScreen: (identifier){
  //Navigator.of(context).pop();
  //if(identifier=='meals'){
  // Navigator.of(context).push(
   // MaterialPageRoute(builder: (ctx)=>const TabsScreen()),
   //);
  //}
//}),
body:PopScope (
  canPop: false,
  onPopInvoked: (bool didPop) {
    if(didPop) return;
    Navigator.of(context).pop({
      Filter.glutenFree: _glutenFreeFilterSet,
      Filter.lactoseFree: _LactoseFreeFilterSet,
      Filter.vegetarian: _VegetrianFilterSet,
      Filter.vegan: _VeganFilterSet,
    });
  },

  child: Column(
    children: [
      SwitchListTile(
        value: _glutenFreeFilterSet,
       onChanged: (isChecked) {
  setState(() {
    _glutenFreeFilterSet=isChecked;
  });
   }, 
      title: Text('Gluten-free',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),),
      subtitle:Text('only include Gluten-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),) ,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34,right: 22),
      ),
      SwitchListTile(
        value: _LactoseFreeFilterSet,
       onChanged: (isChecked) {
  setState(() {
    _LactoseFreeFilterSet=isChecked;
  });
   }, 
      title: Text('Lactose-free',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),),
      subtitle:Text('only include Lactose-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),) ,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34,right: 22),
      ),
  SwitchListTile(
        value: _VegetrianFilterSet,
       onChanged: (isChecked) {
  setState(() {
    _VegetrianFilterSet=isChecked;
  });
   }, 
      title: Text('Vegetrian',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),),
      subtitle:Text('only include Vegetrian meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),) ,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34,right: 22),
      ),
      SwitchListTile(
        value: _VeganFilterSet,
       onChanged: (isChecked) {
  setState(() {
    _VeganFilterSet=isChecked;
  });
   }, 
      title: Text('Vegan',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),),
      subtitle:Text('only include Vegan meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),) ,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34,right: 22),
      ),
    ],
  ),
),
    );
  }
}