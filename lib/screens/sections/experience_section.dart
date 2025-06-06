import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:pujan_portfolio/models/experience.dart';
import 'dart:html' as html;

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;
    
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            AppColors.background.withBlue(30),
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Experience",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryAccent,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
              
              const SizedBox(height: 40),
              
              Expanded(
                child: isDesktop
                    ? _buildDesktopLayout(context)
                    : _buildMobileLayout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildDesktopLayout(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 800,
        child: _buildTimeline(context),
      ),
    );
  }
  
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTimeline(context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
  
  Widget _buildTimeline(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...ExperienceData.experiences.asMap().entries.map((entry) {
            final index = entry.key;
            final experience = entry.value;
            
            return _TimelineItem(
              experience: experience,
              isLast: index == ExperienceData.experiences.length - 1,
              index: index,
            );
          }),
          
          const SizedBox(height: 40),
          
          ElevatedButton(
            onPressed: () {
              const url = 'icons/Pujan_Bohora_Resume_FlutterDeveloper.pdf';
              html.AnchorElement anchorElement = html.AnchorElement(href: url);
              anchorElement.download = "Pujan_Bohora_Resume.pdf";
              anchorElement.click();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryAccent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            child: const Text("Download Resume"),
          ).animate().fadeIn(
            duration: 600.ms,
            delay: Duration(
              milliseconds: 200 + (ExperienceData.experiences.length * 300),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final Experience experience;
  final bool isLast;
  final int index;
  
  const _TimelineItem({
    required this.experience,
    required this.isLast,
    required this.index,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineLine(),
          const SizedBox(width: 24),
          Expanded(
            child: _buildExperienceCard(context),
          ),
        ],
      ),
    ).animate().fadeIn(
      duration: 600.ms,
      delay: Duration(milliseconds: 200 + (widget.index * 300)),
    );
  }
  
  Widget _buildTimelineLine() {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovered ? AppColors.primaryAccent : Colors.white,
            border: Border.all(
              color: AppColors.primaryAccent,
              width: 2,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primaryAccent.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
        ),
        if (!widget.isLast)
          Container(
            width: 2,
            height: 120,
            color: Colors.white.withOpacity(0.2),
          ),
      ],
    );
  }
  
  Widget _buildExperienceCard(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _isHovered
            ? AppColors.background.withOpacity(0.9)
            : AppColors.background.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _isHovered
              ? AppColors.primaryAccent
              : Colors.white.withOpacity(0.1),
          width: 2,
        ),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppColors.primaryAccent.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.experience.title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: _isHovered
                      ? AppColors.primaryAccent
                      : Colors.white,
                ),
              ),
              Text(
                widget.experience.period,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Text(
            widget.experience.organization,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          
          if (widget.experience.location != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.experience.location!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
          
          const SizedBox(height: 16),
          
          ...widget.experience.description.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• "),
                  Expanded(
                    child: Text(item),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
