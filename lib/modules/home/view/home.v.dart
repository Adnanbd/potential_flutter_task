import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potential_task/modules/home/components/single.issue.card.v.dart';
import 'package:potential_task/modules/home/provider/home.p.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Search Example'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: homeData.when(
              data: (data) {
                if (data == null) {
                  return const Text('No Data');
                }
                return ListView.builder(
                  itemCount: data.length, // Replace with your actual data length
                  itemBuilder: (context, index) {
                    return SingleIssueCardView(
                      gitIssue: data[index],
                    );
                  },
                );
              },
              error: (error, t) {
                return const Text('Error');
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
