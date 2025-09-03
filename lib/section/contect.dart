import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/animated_ppear.dart';
import '../widget/section_container.dart';
import '../theme.dart';

class ContactSection extends StatelessWidget {
  final Key anchorKey;
  const ContactSection({super.key, required this.anchorKey});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Let’s work together",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 8),
              Text(
                "Have an idea or project in mind? I can help you bring it to life with Flutter and stunning, responsive UI/UX.",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppTheme.textMuted),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: () async {
                      final uri = Uri(
                        scheme: 'mailto',
                        path: 'Deepakgaur.dg69@gmail.com',
                        query: 'subject=Project%20Inquiry&body=Hi%20Aditya,',
                      );
                      await launchUrl(uri);
                    },
                    icon: const Icon(Icons.mail),
                    label: const Text("Deepakgaur.dg69@gmail.com"),
                  ),
                  OutlinedButton.icon(
                    onPressed: () async => launchUrl(Uri.parse("https://www.linkedin.com/in/deepak-sharma-37a679203/")),
                    icon: const Icon(Icons.business_center),
                    label: const Text("LinkedIn"),
                  ),
                  OutlinedButton.icon(
                    onPressed: () async => launchUrl(Uri.parse("https://github.com/DeepakSharma09")),
                    icon: const Icon(Icons.code),
                    label: const Text("GitHub"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
