import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:potential_task/connection/get.label.c.dart';
import 'package:potential_task/modules/home/model/git.issue.m.dart';

part 'label.p.g.dart';

@Riverpod(keepAlive: true)
class LabelP extends _$LabelP {
  @override
  Future<List<Label>?> build() async {
    final t = await getAllLabels();
    return t;
  }
}

final pageNoProvider = StateProvider<int>((ref) => 2);

Future<List<Label>> getAllLabels() async {
  List<Label> labels = [];
  int page = 1;

  while (true) {
    final t = await getLabels(pageNo: page) ?? [];
    if (t.isEmpty) {
      break;
    }
    labels.addAll(t);
    page++;
  }

  return labels;
}

final selectedListOfLabels = StateProvider<List<Label>>((ref) => []);
