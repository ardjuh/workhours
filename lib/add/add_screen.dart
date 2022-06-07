import 'package:flutter/material.dart';
import 'package:workhours/add/add_widget.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: AddWidget(),
    );
  }
}
