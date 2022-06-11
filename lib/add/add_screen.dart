import 'package:flutter/material.dart';
import 'package:workhours/add/add_widget.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      child: AddWidget(width: width - 32),
    );
  }
}
