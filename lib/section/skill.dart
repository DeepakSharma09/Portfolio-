import 'package:flutter/material.dart';

import '../widget/animated_ppear.dart';
import '../widget/section_container.dart';

class SkillsSection extends StatelessWidget {
  final Key anchorKey;
  const SkillsSection({super.key, required this.anchorKey});

  @override
  Widget build(BuildContext context) {
    final chips = [
      "Flutter", "Dart", "GetX", "Firebase", "Live Stream", " Payment Gateway",
      "Figma", "Clean Architecture", "REST APIs",
    ];

    return SectionContainer(
      anchorKey: anchorKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedAppear(
            child: Text("Skills",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                )),
          ),
          const SizedBox(height: 12),
          AnimatedAppear(
            delay: const Duration(milliseconds: 120),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: chips
                  .map(
                    (c) => Chip(
                  label: Text(c),
                  backgroundColor: const Color(0x12151B22),
                  side: const BorderSide(color: Color(0x33404A57)),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
