import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pujan_portfolio/bloc/navigation_bloc.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:pujan_portfolio/models/section.dart';

class PortfolioNavigationBar extends StatelessWidget {
  const PortfolioNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: AppSections.all.map((section) {
                final isActive = state.currentSection == section;
                return _NavDot(
                  isActive: isActive,
                  section: section,
                );
              }).toList(),
            ).animate().fadeIn(duration: 800.ms, delay: 1000.ms);
          },
        ),
      ),
    );
  }
}

class _NavDot extends StatefulWidget {
  final bool isActive;
  final Section section;

  const _NavDot({
    required this.isActive,
    required this.section,
  });

  @override
  State<_NavDot> createState() => _NavDotState();
}

class _NavDotState extends State<_NavDot> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          context.read<NavigationBloc>().add(NavigateToSection(widget.section));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isHovered || widget.isActive ? 16.0 : 8.0,
            height: _isHovered || widget.isActive ? 16.0 : 8.0,
            decoration: BoxDecoration(
              color: widget.isActive 
                  ? AppColors.primaryAccent 
                  : Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: widget.isActive || _isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.primaryAccent.withOpacity(0.5),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      )
                    ]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
