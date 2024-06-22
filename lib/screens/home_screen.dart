// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<GlobalKey> globalKeyList = [];

  ScrollController scrollController = ScrollController();

  ///
  Future<void> scrollToIndex(int index) async {
    final target = globalKeyList[index].currentContext!;

    await Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 1000),
    );
  }

  ///
  @override
  Widget build(BuildContext context) {
    globalKeyList = List.generate(20, (index) => GlobalKey());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToIndex(7);
    });

    return DefaultTabController(
      length: 15,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.transparent,
            padding: EdgeInsets.zero,
            tabs: _getTabs(),
          ),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children:
                [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].map((e) {
              return Column(
                children: [
                  Row(
                    key: globalKeyList[e],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.toString(), style: const TextStyle(fontSize: 30)),
                      Container(),
                    ],
                  ),
                  Container(height: 1000),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  List<Widget> _getTabs() {
    final list = <Widget>[];

    for (var i = 0; i < 15; i++) {
      list.add(
        TextButton(
          onPressed: () {
            scrollToIndex(i);
          },
          child: Text(i.toString()),
        ),
      );
    }
    return list;
  }
}
