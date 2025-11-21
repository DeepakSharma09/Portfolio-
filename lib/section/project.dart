
import 'package:flutter/material.dart';
import '../model/project.dart';
import '../widget/Project_Sample_Viewer.dart';
import '../widget/animated_ppear.dart';
import '../widget/section_container.dart';
import '../theme.dart';

class ProjectsSection extends StatelessWidget {
  final Key anchorKey;
  const ProjectsSection({super.key, required this.anchorKey});

  @override
  Widget build(BuildContext context) {
    final data = [
      const Project(
        title: "Mokhani",
        description:
            "A mobile application that enables aspiring talent to create comprehensive digital portfolios with photos, videos, and credentials, while connecting them directly with casting opportunities and contract offers from industry professionals",
        tags: ["Flutter", "Node JS", "MVVM", "GetX", "APIs"],
        imagePath: "assets/Image/Mokhani.png",
        link: "",
        samples: [
          ProjectSample(
            type: SampleType.image,
            src: "assets/Mokhani/DashBoard.png",
            caption: "DashBoard",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/Mokhani/Tranding Projects.png",
            caption: "Tranding Projects",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/Mokhani/Portfolio.png",
            caption: "PortFolio",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/Mokhani/profile.png",
            caption: "Profile",
          ),
          // ProjectSample(
          //   type: SampleType.link,
          //   src:
          //       "https://play.google.com/store/apps/details?id=com.launch.dhaba29",
          //   caption: "Play Store listing",
          // ),
        ],
      ),
      const Project(
        title: "Dhaba 29 — Restaurant Suite",
        description:
            "End-to-end system: inventory, payroll, procurement, KPIs, dashboards, and franchise analytics.",
        tags: ["Flutter", "Laravel", "APIs", "GetX"],
        imagePath: "assets/Image/dhaba_logo.png",
        link:
            "https://play.google.com/store/apps/details?id=com.launch.dhaba29",
        samples: [
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Billing Page.jpeg",
            caption: "Billing & order management",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Inventory page.jpeg",
            caption: "Inventory",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Orders.jpeg",
            caption: "Order tracking & kitchen display",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Staff KPI.jpeg",
            caption: "Staff KPIs & performance",
          ),
          ProjectSample(
            type: SampleType.link,
            src:
                "https://play.google.com/store/apps/details?id=com.launch.dhaba29",
            caption: "Play Store listing",
          ),
        ],
      ),
      const Project(
        title: "Jobizo Works — Labour Management",
        description:
            "Role-based app: labour, customer, manager flows, salary requests, payroll, attendance.",
        tags: ["Flutter", "Laravel", "APIs"],
        imagePath: "assets/Image/jobizoLogo.png",
        link:
            "https://play.google.com/store/apps/details?id=com.jobizowork.jobizo",
        samples: [
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Custmor dashbaord.jpeg",
            caption: "Customer dashboard",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Labour DashBoard.jpeg",
            caption: "Labour dashboard",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Projects for labours.jpeg",
            caption: "Projects for labours",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/SampleImages/Join us.jpeg",
            caption: "Join us page",
          ),
          ProjectSample(
            type: SampleType.link,
            src:
                "https://play.google.com/store/apps/details?id=com.jobizowork.jobizo",
            caption: "Play Store listing",
          ),
        ],
      ),
      const Project(
        title: "Uthix – E-Learning",
        description:
            "A modern e-learning platform offering live classes, book reservations, and seamless teacher-student interaction through chat.",
        tags: ["RestAPI", "Online Streaming", "Payment Gateway"],
        imagePath: "assets/Image/Uthix_logo.png",
        link:
            "https://play.google.com/store/apps/details?id=com.uthix.uthix_app",
        samples: [
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/1.png",
            caption: "App onboarding screens",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/Student Dashboard.jpeg",
            caption: "Student dashboard",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/Student e-commerce part.jpeg",
            caption: "E-commerce integration",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/Student classes.jpeg",
            caption: " classes",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/Student Chatting Part.jpeg",
            caption: "Chatting interface",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/Instructor dashboard.jpeg",
            caption: "Instructor dashboard",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/Instructor Classroom.jpeg",
            caption: "Instructor classroom management",
          ),
          ProjectSample(
            type: SampleType.image,
            src: "assets/uthix/Seller dashboard.jpeg",
            caption: "Seller dashboard",
          ),
          ProjectSample(
            type: SampleType.link,
            src:
                "https://play.google.com/store/apps/details?id=com.uthix.uthix_app",
            caption: "Play Store listing",
          ),
        ],
      ),
    ];

    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = width >= 1200 ? 3 : (width >= 800 ? 2 : 1);

    return SectionContainer(
      anchorKey: anchorKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedAppear(
            child: Text("Projects",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    )),
          ),
          const SizedBox(height: 12),
          AnimatedAppear(
            delay: const Duration(milliseconds: 120),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: data.length,
              itemBuilder: (_, i) => _ProjectCard(p: data[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project p;
  const _ProjectCard({required this.p});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hovered = false;

  void _openSamples() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(.6),
      builder: (_) => ProjectSamplesViewer(project: widget.p),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform:
            hovered ? (Matrix4.identity()..scale(1.02)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: const Color(0xFF171B22),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hovered
                ? AppTheme.primary.withValues(alpha: 0.4)
                : const Color(0x22222F3E),
          ),
          boxShadow: [
            if (hovered)
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.15),
                blurRadius: 18,
                spreadRadius: 1,
              ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraints(maxHeight: 400),
        child: InkWell(
          onTap: _openSamples, // clicking the card also opens samples
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.p.imagePath != null)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child:
                        Image.asset(widget.p.imagePath!, fit: BoxFit.contain),
                  ),
                const SizedBox(height: 8),
                Text(
                  widget.p.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.p.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppTheme.textMuted),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Wrap(
                    spacing: 2,
                    runSpacing: 2,
                    children: widget.p.tags.take(3).map((t) {
                      return Chip(
                        label: Text(t, style: const TextStyle(fontSize: 11)),
                        backgroundColor: const Color(0x12151B22),
                        side: const BorderSide(color: Color(0x33404A57)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 8),
                // Explicit button to view samples
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton.icon(
                    onPressed: _openSamples,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('View Samples'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
