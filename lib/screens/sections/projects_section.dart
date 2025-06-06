import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:pujan_portfolio/models/project.dart';
import 'package:pujan_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            AppColors.background.withBlue(50),
            AppColors.background.withBlue(20),
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
                "Projects",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryAccent,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
              
              const SizedBox(height: 40),
              
              Expanded(
                child: isDesktop
                    ? _buildDesktopLayout()
                    : _buildMobileLayout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildDesktopLayout() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 1.5,
      ),
      itemCount: ProjectData.projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(
          project: ProjectData.projects[index],
          index: index,
        );
      },
    );
  }
  
  Widget _buildMobileLayout() {
    return ListView.builder(
      itemCount: ProjectData.projects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: ProjectCard(
            project: ProjectData.projects[index],
            index: index,
          ),
        );
      },
    );
  }
}
