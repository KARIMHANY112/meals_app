import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget{

const MealDetailsScreen({super.key, required this.meal});

final Meal meal;

@override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

final isFavorite = favoriteMeals.contains(meal);
  return Scaffold(
appBar: AppBar(
  title: Text(meal.title),
  actions: [   
    IconButton(onPressed: (){
    final wasAdded=   ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal);
      ScaffoldMessenger.of(context).clearSnackBars();

 ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
  content: Text(wasAdded?'meal added':'meal removed'),
),
 );
 },
 icon:AnimatedSwitcher(
  duration:const Duration(milliseconds: 300),
  transitionBuilder: (child, animation) {
    return RotationTransition(
      turns: Tween(begin: 0.8, end:1.0 ).animate(animation),
    child: child,
    ) ;
  }
 , child:Icon(isFavorite ? Icons.star : Icons.star_border,key: ValueKey(isFavorite),) ,
 ),
)
  ],
),
body:SingleChildScrollView(
  child: Column(
    children: [
      Hero(
        tag:meal.id ,
        child: Image.network(
          meal.imageUrl,
        height: 300,
        fit: BoxFit.cover,
        width: double.infinity,
        ),
      ),
      const SizedBox(height:14 ,),
       Text('ingredients',
      style:Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ) ,),
      const SizedBox(height:14 ,),
      for(final ingredient in meal.ingredients)
      Text(ingredient, style:Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),),
      const SizedBox(height: 24,),
       Text('steps',
      style:Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ) ,
       ),
       const SizedBox(height:14 ),
      
      for(final steps in meal.steps)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: Text(steps,textAlign:TextAlign.center , style:Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        ),
      ),
    ],
  ),
)
);
}


}