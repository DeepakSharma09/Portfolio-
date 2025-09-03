import 'package:flutter/material.dart';
import '../theme.dart';
import 'responsive.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String sectionId) onSelect;
  const NavBar({super.key, required this.onSelect});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final items = [
      ("About", "about"),
      ("Skills", "skills"),
      ("Projects", "projects"),
      ("Contact", "contact"),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: R.isDesktop(context) ? 32 : 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppTheme.bg.withValues(alpha: 0.85),
        border: const Border(
          bottom: BorderSide(color: Color(0x22222F3E)),
        ),
      ),
      child: Row(
        children: [
          // Brand
          Text(
            "Deepak Gaur",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          if (!R.isMobile(context))
            Row(
              children: [
                for (final i in items)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () => onSelect(i.$2),
                      child: Text(i.$1),
                    ),
                  ),
                const SizedBox(width: 16),
                FilledButton(
                  onPressed: () => onSelect("contact"),
                  child: const Text("Hire Me"),
                ),
              ],
            )
          else
            PopupMenuButton<String>(
              tooltip: "Menu",
              onSelected: onSelect,
              itemBuilder: (_) => [
                for (final i in items)
                  PopupMenuItem(value: i.$2, child: Text(i.$1)),
                const PopupMenuItem(value: "contact", child: Text("Hire Me")),
              ],
              child: const Icon(Icons.menu),
            ),
        ],
      ),
    );
  }
}
