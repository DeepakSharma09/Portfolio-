import 'package:flutter/material.dart';
import '../theme.dart';
import '../widget/animated_ppear.dart';
import '../widget/responsive.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  final VoidCallback onContact;
  const HeroSection({super.key, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final isMobile = R.isMobile(context);

    return Container(
      padding: R.pagePadding(context).copyWith(top: 48, bottom: 64),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0E1116), Color(0xFF111827)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: R.maxContentWidth(context)),
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              AnimatedAppear(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                        color: AppTheme.primary.withValues(alpha: 0.3)),
                  ),
                  child: const Text(
                      "Flutter • Dart • Payment Gateway •  Live Streaming •  REST API"),
                ),
              ),
              const SizedBox(height: 16),
              AnimatedAppear(
                delay: const Duration(milliseconds: 120),
                child: Text(
                  "I build pixel‑perfect\napps & dashboards.",
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedAppear(
                delay: const Duration(milliseconds: 240),
                child: Text(
                  "Flutter developer crafting pixel-perfect, responsive apps for mobile and web.\n"
                  "I focus on clean code, smooth animations, and scalable UI/UX.",
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textMuted,
                      ),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedAppear(
                delay: const Duration(milliseconds: 360),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: onContact,
                      icon: const Icon(Icons.mail),
                      label: const Text("Contact Me"),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        const path =
                            'web/resume/DEEPAK RESUME EXP..pdf'; // relative to /web
                        final a = html.AnchorElement(href: path)
                          ..download =
                              'Deepak_Gaur_Resume.pdf' // forces "Save as"
                          ..rel = 'noopener'
                          ..target = '_self';
                        html.document.body?.append(a);
                        a.click();
                        a.remove();
                      },
                      icon: const Icon(Icons.download),
                      label: const Text("Download Résumé"),
                    )
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
