import 'package:flutter/material.dart';
import 'package:meals/providers/fliters_provider.dart';
import 'package:meals/widgets/drawer_filter_tile.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: const Column(
        children: [
          DrawerFilterTile(
            filter: Filter.glutenFree,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          DrawerFilterTile(
            filter: Filter.lactoseFree,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          DrawerFilterTile(
            filter: Filter.vegetarian,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          DrawerFilterTile(
            filter: Filter.vegan,
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
