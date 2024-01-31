import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potential_task/modules/home/components/helper/convert.label.to.menu.item.dart';
import 'package:search_choices/search_choices.dart';

import 'package:potential_task/modules/home/components/helper/on.filter.dart';
import 'package:potential_task/modules/home/components/label.v.dart';
import 'package:potential_task/modules/home/model/git.issue.m.dart';
import 'package:potential_task/modules/home/provider/label.p.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedLabels = ref.watch(labelPProvider);

    List<int> selectedItemsMultiCustomDisplayDialog = [];

    return fetchedLabels.when(data: (data) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 106, 106, 106),
              width: .8,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SearchChoices.multiple(
            items: convertLabelToMenuItem(data),
            selectedItems: selectedItemsMultiCustomDisplayDialog,
            hint: "Filter by label",
            searchHint: "Select label",
            clearSearchIcon: const Icon(Icons.search),
            onChanged: (value) {
              selectedItemsMultiCustomDisplayDialog = value;
              onFilter(value, ref, data);
            },
            fieldDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            isExpanded: true,
            selectedValueWidgetFn: (item) {
              return (LabelView(label: Label(name: item)));
            },
            selectedAggregateWidgetFn: (List<Widget> list) {
              return (Wrap(children: list));
            },
            closeButton: 'Filter',
          ),
        ),
      );
    }, error: (r, t) {
      return const Center(child: Text('Something Wrong!'));
    }, loading: () {
      return const Center(child: Text('Loading Labels ...'));
    });
  }
}
