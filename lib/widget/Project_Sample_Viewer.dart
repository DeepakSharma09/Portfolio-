// lib/widget/project_samples_viewer.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/project.dart';
import '../theme.dart';

class ProjectSamplesViewer extends StatefulWidget {
  final Project project;
  const ProjectSamplesViewer({super.key, required this.project});

  @override
  State<ProjectSamplesViewer> createState() => _ProjectSamplesViewerState();
}

class _ProjectSamplesViewerState extends State<ProjectSamplesViewer> {
  final _page = PageController();
  int _index = 0;

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return Dialog(
      backgroundColor: const Color(0xFF0E1116),
      insetPadding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, c) {
          final maxW = c.maxWidth.clamp(320, 1200);
          final maxH = c.maxHeight.clamp(320, 800);
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxW.toDouble(), maxHeight: maxH.toDouble()),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          p.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (p.link != null)
                        TextButton.icon(
                          onPressed: () => launchUrl(Uri.parse(p.link!), mode: LaunchMode.externalApplication),
                          icon: const Icon(Icons.open_in_new),
                          label: const Text("Open Project"),
                        ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                        tooltip: 'Close',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Gallery
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _page,
                          onPageChanged: (i) => setState(() => _index = i),
                          itemCount: p.samples.isEmpty ? 1 : p.samples.length,
                          itemBuilder: (_, i) {
                            if (p.samples.isEmpty) {
                              return const _EmptyState();
                            }
                            final s = p.samples[i];
                            switch (s.type) {
                              case SampleType.image:
                                final isAsset = s.src.startsWith('assets/');
                                final img = isAsset
                                    ? Image.asset(s.src, fit: BoxFit.contain)
                                    : Image.network(s.src, fit: BoxFit.contain);
                                return Container(
                                  color: const Color(0xFF111827),
                                  alignment: Alignment.center,
                                  child: img,
                                );

                              case SampleType.link:
                                return _LinkCard(url: s.src, caption: s.caption);

                              case SampleType.video:
                              // Keep it simple: open externally (YouTube/Vimeo/etc.)
                                return _LinkCard(
                                  url: s.src,
                                  caption: s.caption ?? 'Watch video',
                                  icon: Icons.play_circle,
                                );
                            }
                          },
                        ),

                        // Prev / Next arrows (desktop-like)
                        Positioned(
                          left: 8,
                          top: 0,
                          bottom: 0,
                          child: _NavArrow(
                            icon: Icons.chevron_left,
                            onTap: () {
                              if (_index > 0) _page.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
                            },
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 0,
                          bottom: 0,
                          child: _NavArrow(
                            icon: Icons.chevron_right,
                            onTap: () {
                              if (_index < (p.samples.length - 1)) {
                                _page.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Dots + caption
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Column(
                    children: [
                      if (p.samples.length > 1)
                        Wrap(
                          spacing: 6,
                          children: List.generate(
                            p.samples.length,
                                (i) => Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: i == _index ? AppTheme.primary : const Color(0xFF3B4250),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      if (p.samples.isNotEmpty && p.samples[_index].caption != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          p.samples[_index].caption!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _NavArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(.15),
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 28),
        ),
      ),
    );
  }
}

class _LinkCard extends StatelessWidget {
  final String url;
  final String? caption;
  final IconData icon;
  const _LinkCard({required this.url, this.caption, this.icon = Icons.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111827),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: AppTheme.primary),
          const SizedBox(height: 12),
          Text(caption ?? 'Open link', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111827),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.image_not_supported, size: 42, color: Colors.white54),
          SizedBox(height: 8),
          Text('No samples added for this project', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
