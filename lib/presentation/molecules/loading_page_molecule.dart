import 'package:cybear_jinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class LoadingPageMolecule extends StatelessWidget {
  const LoadingPageMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: const CircularProgressIndicatorAtom(),
    );
  }
}
