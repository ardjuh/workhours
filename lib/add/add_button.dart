import 'package:flutter/material.dart';
import 'package:workhours/add/add_screen.dart';
import 'add_label.dart';
import '../hero_dialog_route.dart';
import '../data/consts.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      flightShuttleBuilder: _flightShuttleBuilder,
      tag: kAddScreenHeroTag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _openAddScreen(context),
          child: Material(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const AddLabel(),
          ),
        ),
      ),
    );
  }

  void _openAddScreen(BuildContext context) {
    Navigator.of(context).push(
      HeroDialogRoute(
        builder: (builder) => const AddScreen(),
      ),
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext ctx,
    Animation<double> animation,
    HeroFlightDirection direction,
    BuildContext fromCtx,
    BuildContext toCtx,
  ) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(
          16 + ((constraints.maxHeight) - 56) / 284 * 24,
        ),
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView(
              shrinkWrap: true,
              children: const [
                AddLabel(),
                Divider(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
