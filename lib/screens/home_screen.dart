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
    globalKeyList = List.generate(10, (index) => GlobalKey());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToIndex(7);
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => scrollToIndex(0),
              icon: const Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () => scrollToIndex(1),
              icon: const Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () => scrollToIndex(2),
              icon: const Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () => scrollToIndex(3),
              icon: const Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () => scrollToIndex(4),
              icon: const Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () => scrollToIndex(5),
              icon: const Icon(Icons.ac_unit)),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((e) {
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
    );
  }
}
