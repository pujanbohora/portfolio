import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:pujan_portfolio/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  
  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _isHovered 
              ? (Matrix4.identity()..translate(0.0, -10.0, 0.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.7),
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
                      color: AppColors.primaryAccent.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: _isExpanded
                ? _buildExpandedView(context)
                : _buildCompactView(context),
          ),
        ),
      ),
    ).animate().fadeIn(
      duration: 600.ms,
      delay: Duration(milliseconds: 200 + (widget.index * 200)),
    );
  }
  
  Widget _buildCompactView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.project.title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: AppColors.primaryAccent,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 12),
          
          Expanded(
            child: Text(
              widget.project.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.project.technologies.take(3).map((tech) {
              return Chip(
                label: Text(
                  tech,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColors.background.withOpacity(0.8),
                side: BorderSide(
                  color: AppColors.secondaryAccent.withOpacity(0.5),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildExpandedView(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.project.title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.primaryAccent,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Text(
                widget.project.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              
              const SizedBox(height: 24),
              
              Text(
                "Technologies",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 12),
              
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.technologies.map((tech) {
                  return Chip(
                    label: Text(
                      tech,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: AppColors.background.withOpacity(0.8),
                    side: BorderSide(
                      color: AppColors.secondaryAccent.withOpacity(0.5),
                    ),
                  );
                }).toList(),
              ),
              
              if (widget.project.link != null) ...[
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text("View Project"),
                ),
              ],
              
              const SizedBox(height: 40),
            ],
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => setState(() => _isExpanded = false),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
