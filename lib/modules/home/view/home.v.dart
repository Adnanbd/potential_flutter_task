import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potential_task/modules/home/components/search.field.dart';
import 'package:potential_task/modules/home/components/single.issue.card.v.dart';
import 'package:potential_task/modules/home/provider/home.p.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Search Example'),
      ),
      body: Column(
        children: [
          const SearchField(),
          Expanded(
            child: homeData.when(
              data: (data) {
                if (data == null) {
                  return const Text('No Data');
                }

                return ListView.builder(
                  controller: scrollController,
                  itemCount: data.length + 1,
                  itemBuilder: (context, index) {
                    if (index < data.length) {
                      return SingleIssueCardView(
                        gitIssue: data[index],
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                );
              },
              error: (error, t) {
                return const Text('Error');
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
