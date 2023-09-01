import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/fliters_provider.dart';

class DrawerFilterTile extends ConsumerStatefulWidget {
  const DrawerFilterTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.filter});

  final String title;
  final String subtitle;
  final Filter filter;

  @override
  ConsumerState<DrawerFilterTile> createState() => _DrawerFilterTileState();
}

class _DrawerFilterTileState extends ConsumerState<DrawerFilterTile> {
  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.read(filtersProvider);
    var isFilterActive = activeFilters[widget.filter]!;
    return SwitchListTile(
      value: isFilterActive,
      onChanged: (isChecked) {
        setState(() {
          isFilterActive = isChecked;
          ref
              .read(filtersProvider.notifier)
              .setFilter(widget.filter, isFilterActive);
        });
      },
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
