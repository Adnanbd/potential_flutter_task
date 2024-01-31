import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potential_task/modules/home/components/label.v.dart';
import 'package:potential_task/modules/home/model/git.issue.m.dart';
import 'package:potential_task/modules/home/provider/label.p.dart';
import 'package:search_choices/search_choices.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedLabels = ref.watch(labelPProvider);

    List<int> selectedItemsMultiCustomDisplayDialog = [];

    return fetchedLabels.when(data: (data) {
      List<DropdownMenuItem<String>> gg = List<DropdownMenuItem<String>>.generate(
          data?.length ?? 0,
          (index) => DropdownMenuItem<String>(
                value: '${data?[index].name}',
                child: Text('${data?[index].name}'),
              ));
      return SearchChoices.multiple(
        items: gg,
        selectedItems: selectedItemsMultiCustomDisplayDialog,
        hint: "Select label",
        searchHint: "Select label",
        onChanged: (value) {
          selectedItemsMultiCustomDisplayDialog = value;
        },
        isExpanded: true,
        selectedValueWidgetFn: (item) {
          return (LabelView(label: Label(name: item)));
        },
        selectedAggregateWidgetFn: (List<Widget> list) {
          return (Column(children: [
            Text("${list.length} Label Selected"),
            Wrap(children: list),
          ]));
        },
        
      );
    }, error: (r, t) {
      return const SizedBox();
    }, loading: () {
      return const SizedBox();
    });
  }
}
