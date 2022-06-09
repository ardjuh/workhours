import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0, kToolbarHeight),
      child:
          (kIsWeb || Platform.isLinux || Platform.isMacOS || Platform.isWindows)
              ? FittedBox(child: title)
              : AppBar(title: title),
    );
  }
}
