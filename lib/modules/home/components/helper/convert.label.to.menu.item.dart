import 'package:flutter/material.dart' show DropdownMenuItem, Text;
import 'package:potential_task/modules/home/model/git.issue.m.dart';

List<DropdownMenuItem<String>> convertLabelToMenuItem(List<Label>? data) {
  return List<DropdownMenuItem<String>>.generate(
    data?.length ?? 0,
    (index) => DropdownMenuItem<String>(
      value: '${data?[index].name}',
      child: Text('${data?[index].name}'),
    ),
  );
}
