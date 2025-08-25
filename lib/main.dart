import 'package:flutter/material.dart';
import 'section/about.dart';
import 'section/contect.dart';
import 'section/hero_section.dart';
import 'section/project.dart';
import 'section/skill.dart';
import 'widget/nav_bar.dart';
import 'widget/section_container.dart';
import 'theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final _scrollController = ScrollController();

  // Anchors
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void _scrollTo(String id) {
    final key = switch (id) {
      "about" => aboutKey,
      "skills" => skillsKey,
      "projects" => projectsKey,
      "contact" => contactKey,
      _ => aboutKey,
    };
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.08,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(onSelect: _scrollTo),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: HeroSection(onContact: () => _scrollTo("contact")),
          ),
          SliverToBoxAdapter(
            child: AboutSection(anchorKey: aboutKey),
          ),
          SliverToBoxAdapter(
            child: SkillsSection(anchorKey: skillsKey),
          ),
          SliverToBoxAdapter(
            child: ProjectsSection(anchorKey: projectsKey),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: ContactSection(anchorKey: contactKey),
          ),
          SliverToBoxAdapter(
            child: SectionContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Center(
                  child: Text(
                    "© ${DateTime.now().year} Deepak Gaur — Built with Flutter",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: const Color(0xFF7D8794)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _BackToTopButton(controller: _scrollController),
    );
  }
}

class _BackToTopButton extends StatefulWidget {
  final ScrollController controller;
  const _BackToTopButton({required this.controller});

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  void _onScroll() {
    final shouldShow = widget.controller.offset > 300;
    if (show != shouldShow) {
      setState(() => show = shouldShow);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();
    return FloatingActionButton.extended(
      onPressed: () {
        widget.controller.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      },
      label: const Text("Top"),
      icon: const Icon(Icons.keyboard_arrow_up),
    );
  }
}
