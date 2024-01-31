import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:potential_task/connection/get.issue.c.dart';
import 'package:potential_task/modules/home/model/git.issue.m.dart';

part 'home.p.g.dart';

@riverpod
class Home extends _$Home {
  @override
  Future<List<GitIssueModel>?> build() async {
    final t = await getIssues();
    return t;
  }

  void fetch() async {
    final pageNo = ref.read(pageNoProvider);
    final newIssues = await getIssues(pageNo: pageNo) ?? [];
    ref.read(pageNoProvider.notifier).update((state) => state + 1);
    final prevIssues = state.value ?? [];
    state = AsyncData([...prevIssues, ...newIssues]);
  }
}

final pageNoProvider = StateProvider<int>((ref) => 2);
