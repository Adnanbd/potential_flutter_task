import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potential_task/connection/get.label.c.dart';
import 'package:potential_task/modules/home/model/git.issue.m.dart';
import 'package:potential_task/modules/home/provider/home.p.dart';
import 'package:potential_task/modules/home/provider/label.p.dart';

onFilter(List<int> value, WidgetRef ref, List<Label>? data) {
  List<Label> labels = indexToLabelList(data ?? [], value);
  ref.read(selectedListOfLabels.notifier).state = labels;
  ref.read(homeProvider.notifier).filter(labels);
}
