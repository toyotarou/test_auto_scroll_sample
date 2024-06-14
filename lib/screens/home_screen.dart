import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<GlobalKey> globalKeyList = [GlobalKey(), GlobalKey(), GlobalKey()];

  ScrollController scrollController = ScrollController();

  ///
  Future<void> scrollToIndex(int index) async {
    final categories = globalKeyList[index].currentContext!;

    await Scrollable.ensureVisible(
      categories,
      duration: const Duration(milliseconds: 1000),
    );
  }

  ///
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToIndex(2);
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => scrollToIndex(0), icon: const Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () => scrollToIndex(1), icon: const Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () => scrollToIndex(2), icon: const Icon(Icons.ac_unit)),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            _buildCategoryTitle(0),
            Container(height: 1000),
            _buildCategoryTitle(1),
            Container(height: 1000),
            _buildCategoryTitle(2),
            Container(height: 1000),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  ///
  Widget _buildCategoryTitle(int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent),
      ),
      child: Row(
        key: globalKeyList[index],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            index.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Container(),
        ],
      ),
    );
  }
}
