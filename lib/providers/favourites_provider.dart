import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super(const []);

  bool toggleMealFavouriteStatus(Meal meal) {
    final isMealFavourite = state.contains(meal);
    if (isMealFavourite) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
    return isMealFavourite;
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>((ref) {
  return FavouritesNotifier();
});
