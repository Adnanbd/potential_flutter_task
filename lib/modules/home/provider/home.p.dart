import 'package:potential_task/connection/get.issue.c.dart';
import 'package:potential_task/modules/home/model/git.issue.m.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.p.g.dart';

@riverpod
class Home extends _$Home {
  @override
  Future<List<GitIssueModel>?> build() async {
    final t = await getIssues();
    return t;
  }
}
