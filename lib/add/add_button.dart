import 'package:flutter/material.dart';
import 'add_label.dart';
import 'add_widget.dart';
import '../hero_dialog_route.dart';
import '../consts.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      flightShuttleBuilder: _flightShuttleBuilder,
      tag: addScreenHeroTag,
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
        builder: (builder) => const AddWidget(),
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
          16 + ((constraints.maxHeight) - 56) / 400 * 24,
        ),
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: const Align(
            alignment: Alignment.topLeft,
            child: AddLabel(),
          ),
        ),
      );
    });
  }
}
