import 'package:flutter/material.dart';
import 'package:test/add_label.dart';
import 'package:test/consts.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, this.width = 218});

  final double width;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var selected = selectionOptions[0];
  var isExpanded1 = true;
  var isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.primaryContainer;

    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: widget.width,
        child: Hero(
          tag: addScreenHeroTag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Material(
              color: backgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddLabel(),
                  const Divider(),
                  ExpansionPanelList(
                    // dividerColor: Colors.transparent,
                    elevation: 0,
                    expansionCallback: (panelIndex, isExpanded) {
                      if (!isExpanded) {
                        isExpanded1 = false;
                        isExpanded2 = false;
                      }
                      if (panelIndex == 0) {
                        isExpanded1 = !isExpanded;
                      } else {
                        isExpanded2 = !isExpanded;
                      }
                      setState(() {});
                    },
                    children: [
                      ExpansionPanel(
                        backgroundColor: backgroundColor,
                        canTapOnHeader: true,
                        headerBuilder: (context, open) {
                          return ListTile(
                            title: Text(selected.title),
                          );
                        },
                        isExpanded: isExpanded1,
                        body: Column(
                          children: [
                            for (final option in selectionOptions)
                              InkWell(
                                child: Text(option.title),
                                onTap: () => setState(() {
                                  selected = option;
                                  isExpanded1 = false;
                                }),
                              )
                          ],
                        ),
                      ),
                      ExpansionPanel(
                        backgroundColor: backgroundColor,
                        canTapOnHeader: true,
                        headerBuilder: (context, open) {
                          return const ListTile(
                            title: Text("hoi"),
                          );
                        },
                        isExpanded: isExpanded2,
                        body: Column(
                          children: [
                            OutlinedButton(
                              onPressed: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                currentDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              ),
                              child: const Text("Datum"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Center(
                    child: OutlinedButton(
                      onPressed: () => {},
                      child: const Text("Toevoegen"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
