import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:potential_task/modules/home/components/search.field.dart';
import 'package:potential_task/modules/home/components/single.issue.card.v.dart';
import 'package:potential_task/modules/home/provider/home.p.dart';
import 'package:potential_task/modules/home/provider/label.p.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        ref.watch(homeProvider.notifier).fetch();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeData = ref.watch(homeProvider);
    final labels = ref.read(selectedListOfLabels);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Issues'),
        centerTitle: true,
        backgroundColor: Colors.amber.withOpacity(.5),
      ),
      body: Column(
        children: [
          const SearchField(),
          Expanded(
            child: homeData.when(
              data: (data) {
                if (data == null) {
                  return const Text('No Data Found. Try Again!');
                }
                return data.isEmpty
                    ? const Center(child: Text('No Issue Found. Try Again!'))
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: data.length + 1,
                        itemBuilder: (context, index) {
                          if (index < data.length) {
                            return SingleIssueCardView(
                              gitIssue: data[index],
                            );
                          } else {
                            return labels.isEmpty
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : const SizedBox();
                          }
                        },
                      );
              },
              error: (error, t) {
                return const Text('Something Wrong. Try again!');
              },
              loading: () {
                return const Center(child: SizedBox(height: 60, width: 60, child: CircularProgressIndicator()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
