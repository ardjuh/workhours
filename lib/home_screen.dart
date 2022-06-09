import 'package:flutter/material.dart';
import 'package:workhours/data/data.dart';
import 'data/data_widget.dart';
import 'add/add_button.dart';
import 'add/add_widget.dart';
import 'data/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isBigHorizontal = height - 350 >= 2 * 64;
    final isBigVertical = width > kAddWidgetWidth;
    final isBig = isBigHorizontal || isBigVertical;
    final data = Data();

    return Scaffold(
      appBar: AppBar(
        title: Text(data.totalMoney),
        actions: [
          IconButton(
            tooltip: "Verzenden",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("hoi")),
              );
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: AnimatedPadding(
        duration: kAnimationDuration,
        padding: EdgeInsets.only(right: (isBigVertical) ? 300 : 0),
        child: DataWidget(isScrollable: !isBigHorizontal),
      ),
      floatingActionButton: (isBig)
          ? AddWidget(
              width: (width >= kAddWidgetWidth) ? 268 : width - 32,
              isExpanded: false,
            )
          : const AddButton(),
    );
  }
}
