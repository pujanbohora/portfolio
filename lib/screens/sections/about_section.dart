import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            AppColors.background.withBlue(50),
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        ),
      ),
    );
  }
  
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _buildAboutContent(context),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 4,
          child: _buildProfileImage(),
        ),
      ],
    );
  }
  
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          _buildProfileImage(),
          const SizedBox(height: 40),
          _buildAboutContent(context),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
  
  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "About Me",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: AppColors.primaryAccent,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
        
        const SizedBox(height: 24),
        
        Text(
          "Pursuing Master's degree in Computer Science at Wright State University with a focus on Flutter, AI/ML integration, and full-stack development.",
          style: Theme.of(context).textTheme.headlineMedium,
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
        
        const SizedBox(height: 16),
        
        Text(
          "Previously worked as a Mobile App Developer at Digi Technology Pvt. Ltd., Nepal, where I developed and maintained Flutter applications, integrated REST APIs and Firebase services, and implemented UI/UX designs and animations.",
          style: Theme.of(context).textTheme.bodyLarge,
        ).animate().fadeIn(duration: 600.ms, delay: 600.ms),
        
        const SizedBox(height: 16),
        
        Text(
          "I'm passionate about creating elegant, user-friendly applications that solve real-world problems. My experience spans from mobile development to cybersecurity and identity management solutions.",
          style: Theme.of(context).textTheme.bodyLarge,
        ).animate().fadeIn(duration: 600.ms, delay: 800.ms),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryAccent,
            AppColors.secondaryAccent,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryAccent.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 280,
          height: 280,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.background,
          ),
          child: ClipOval(
        child: Transform.translate(
        offset: const Offset(0, 0),
        child: Image.asset(
          'assets/profile_pic.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ),

    // ClipOval(
          //   child: Image.asset('assets/profile_pic.jpg', fit: BoxFit.cover,)
          // ),
        ),
      ),
    ).animate().fadeIn(duration: 800.ms).scale(
      begin: const Offset(0.8, 0.8),
      end: const Offset(1.0, 1.0),
      duration: 1000.ms,
      curve: Curves.easeOutBack,
    );
  }

}
