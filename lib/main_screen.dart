import 'package:flutter/material.dart';
import 'package:workhours/data_widget.dart';
import 'add/add_button.dart';
import 'add/add_widget.dart';
import 'consts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isBigHorizontal = height - 350 >= 2 * 64;
    final isBigVertical = width < addWidgetWidth;
    final isBig = isBigHorizontal || isBigVertical;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Werkbriefje"),
        actions: [
          IconButton(
            tooltip: "Verzenden",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("hoi")),
              );
            },
            icon: const Icon(Icons.send),
          )
        ],
      ),
      body: AnimatedPadding(
        duration: animationDuration,
        padding: EdgeInsets.only(right: (isBigHorizontal) ? 300 : 0),
        child: DataWidget(isScrollable: isBig),
      ),
      floatingActionButton: (isBig)
          ? AddWidget(
              width: (width >= addWidgetWidth) ? 268 : width - 32,
              isExpanded: false,
            )
          : const AddButton(),
    );
  }
}
