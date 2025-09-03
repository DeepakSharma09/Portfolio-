import 'package:flutter/material.dart';

import '../theme.dart';
import '../widget/animated_ppear.dart';
import '../widget/responsive.dart';
import '../widget/section_container.dart';

class AboutSection extends StatelessWidget {
  final Key anchorKey;
  const AboutSection({super.key, required this.anchorKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = R.isMobile(context);
    return SectionContainer(
      anchorKey: anchorKey,
      child: AnimatedAppear(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0x22222F3E)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile)
                CircleAvatar(
                  radius: 56,
                  backgroundImage: const AssetImage("assets/Image/photo.jpeg"),
                  backgroundColor: Colors.white.withValues(alpha: 0.06),
                ),
              if (!isMobile) const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Me",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(height: 8),
                    Text(
                      "I’m Deepak, a Flutter Developer  "
                          "I build Flutter apps & dashboards with clean architecture and pixel-perfect UI/UX.\n"
                          "I’ve built and delivered production-ready systems across restaurants, payroll, inventory, e-learning, and e-commerce — all crafted with Flutter for performance and seamless user experiences.",
                        style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppTheme.textMuted),
                    ),
                    const SizedBox(height: 16),
                    const Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _Metric(label: "Projects", value: "2+"),
                        _Metric(label: "Dashboards", value: "12+"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final String label;
  final String value;
  const _Metric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              )),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
      side: const BorderSide(color: Color(0x33404A57)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      backgroundColor: const Color(0x12151B22),
    );
  }
}
