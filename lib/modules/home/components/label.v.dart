import 'package:flutter/material.dart' show BuildContext, Card, Colors, EdgeInsets, Padding, Text, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potential_task/modules/home/model/git.issue.m.dart';

class LabelView extends ConsumerWidget {
  const LabelView({
    super.key,
    required this.label,
  });

  final Label? label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: Colors.amber.withOpacity(.5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text('${label?.name}'),
      ),
    );
  }
}
