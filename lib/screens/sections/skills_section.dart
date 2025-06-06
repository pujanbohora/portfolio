import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:pujan_portfolio/models/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
            AppColors.background.withBlue(20),
            AppColors.background,
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
                "Skills",
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildSkillCategories(context),
        ),
      ],
    );
  }
  
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSkillCategories(context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
  
  Widget _buildSkillCategories(BuildContext context) {
    return Column(
      children: SkillData.categories.map((category) {
        final categorySkills = SkillData.skills
            .where((skill) => skill.category == category)
            .toList();
            
        return Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: _buildCategorySection(context, category, categorySkills),
        );
      }).toList(),
    );
  }
  
  Widget _buildCategorySection(
    BuildContext context, 
    String category, 
    List<Skill> skills,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: Theme.of(context).textTheme.headlineMedium,
        ).animate().fadeIn(
          duration: 600.ms, 
          delay: Duration(
            milliseconds: 400 + SkillData.categories.indexOf(category) * 200,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: skills.asMap().entries.map((entry) {
            final index = entry.key;
            final skill = entry.value;
            
            return _SkillBadge(
              skill: skill,
              delay: Duration(
                milliseconds: 600 + 
                    (SkillData.categories.indexOf(category) * 200) + 
                    (index * 100),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SkillBadge extends StatefulWidget {
  final Skill skill;
  final Duration delay;
  
  const _SkillBadge({
    required this.skill,
    required this.delay,
  });

  @override
  State<_SkillBadge> createState() => _SkillBadgeState();
}

class _SkillBadgeState extends State<_SkillBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: _isHovered 
              ? AppColors.primaryAccent.withOpacity(0.2) 
              : AppColors.background.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
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
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.skill.name,
              style: TextStyle(
                color: _isHovered 
                    ? AppColors.primaryAccent 
                    : Colors.white,
                fontWeight: _isHovered 
                    ? FontWeight.bold 
                    : FontWeight.normal,
              ),
            ),
            
            const SizedBox(width: 8),
            
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getColorForProficiency(widget.skill.proficiency),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(
      duration: 600.ms,
      delay: widget.delay,
    );
  }
  
  Color _getColorForProficiency(int proficiency) {
    if (proficiency >= 90) {
      return Colors.green;
    } else if (proficiency >= 80) {
      return Colors.lightGreen;
    } else if (proficiency >= 70) {
      return Colors.yellow;
    } else {
      return Colors.orange;
    }
  }
}
