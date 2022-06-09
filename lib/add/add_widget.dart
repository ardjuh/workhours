import 'package:flutter/material.dart';

import 'add_label.dart';
import '../consts.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({super.key, this.isExpanded = true, this.width = 268});

  final double width;
  final bool isExpanded;

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  var selected = selectionOptions[0];
  var isExpanded1 = true;
  var isExpanded2 = false;

  @override
  void initState() {
    isExpanded1 = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final width = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        duration: (width >= kAddWidgetWidth - 32 || widget.width == 268)
            ? kAnimationDuration
            : const Duration(milliseconds: 0),
        width: widget.width,
        child: Hero(
          tag: kAddScreenHeroTag,
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
                  LayoutBuilder(
                    builder: (_, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (constraints.maxWidth >= 225)
                            OutlinedButton(
                              onPressed: () => {
                                if (Navigator.canPop(context))
                                  Navigator.pop(context)
                              },
                              child: const Text("Annuleren"),
                            ),
                          OutlinedButton(
                            onPressed: () => {},
                            child: const Text("Toevoegen"),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
