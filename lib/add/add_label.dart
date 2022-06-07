import 'package:flutter/material.dart';

class AddLabel extends StatelessWidget {
  const AddLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 20),
      height: 56,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Material(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            children: const [
              Icon(Icons.add, size: 24),
              SizedBox(width: 8),
              Text("Toevoegen"),
            ],
          ),
        ),
      ),
    );
  }
}
