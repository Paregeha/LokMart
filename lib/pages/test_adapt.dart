import 'package:flutter/material.dart';

class TestAdapt extends StatelessWidget {
  const TestAdapt({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            if (width > 800) {
              return Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: const Placeholder(),
                    ),
                  ),
                  const Expanded(child: Placeholder()),
                  const Expanded(child: Placeholder()),
                  const Expanded(child: Placeholder()),
                ],
              );
            } else if (width > 500) {
              return const Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Placeholder()),
                        Expanded(child: Placeholder()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Placeholder()),
                        Expanded(child: Placeholder(child: Text('data'))),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Expanded(child: Placeholder()),
                  Expanded(child: Placeholder()),
                  Expanded(child: Placeholder()),
                  Expanded(child: Placeholder()),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
