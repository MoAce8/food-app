import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          filterSwitch(
            context,
            'Gluten-free',
            activeFilters[Filters.glutenFree]!,
            (val) {
              ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, val);
              },
          ),

          filterSwitch(
            context,
            'Lactose-free',
            activeFilters[Filters.lactoseFree]!,
                (val) {
              ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, val);
            },
          ),
          filterSwitch(
            context,
            'Vegan',
            activeFilters[Filters.vegan]!,
                (val) {
              ref.read(filtersProvider.notifier).setFilter(Filters.vegan, val);
            },
          ),
          filterSwitch(
            context,
            'Vegetarian',
            activeFilters[Filters.vegetarian]!,
                (val) {
              ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, val);
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile filterSwitch(
    BuildContext context,
    String title,
    bool filter,
    Function(bool val) onChange,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        'Only include ${title.toLowerCase()} meals',
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      contentPadding: const EdgeInsets.only(left: 30, right: 20),
      value: filter,
      onChanged: onChange,
    );
  }
}
