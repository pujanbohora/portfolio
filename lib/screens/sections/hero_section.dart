import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:pujan_portfolio/widgets/animated_background.dart';

import '../../bloc/navigation_bloc.dart';
import '../../models/section.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Stack(
        children: [
          const AnimatedBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                _buildHeroText(context),
                const SizedBox(height: 40),
                _buildScrollIndicator(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildHeroText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hey,",
          style: Theme.of(context).textTheme.displayMedium,
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
        
        const SizedBox(height: 16),
        
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "I'm ",
              style: Theme.of(context).textTheme.displayLarge,
            ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
            
            DefaultTextStyle(
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColors.primaryAccent,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Pujan',
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                isRepeatingAnimation: false,
                totalRepeatCount: 1,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flutter Developer",
              style: Theme.of(context).textTheme.displaySmall,
            ).animate().fadeIn(duration: 600.ms, delay: 800.ms),
            
            Text(
              "AI Enthusiast",
              style: Theme.of(context).textTheme.displaySmall,
            ).animate().fadeIn(duration: 600.ms, delay: 1000.ms),
            
            Text(
              "Problem Solver",
              style: Theme.of(context).textTheme.displaySmall,
            ).animate().fadeIn(duration: 600.ms, delay: 1200.ms),

            Text(
              "I build intuitive mobile apps, love learning about AI, and thrive on solving real-world challenges.",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white70,
                height: 1.5,
              ),
            ).animate().fadeIn(duration: 600.ms, delay: 1400.ms),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }


  Widget _buildScrollIndicator(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // // Get the NavigationBloc and navigate to the About section
        // context.read<NavigationBloc>().add(
        //   const NavigateToSection(AppSections.about),
        // );
      },
      child: Column(
        children: [
          const Text(
            "Scroll down to explore",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.primaryAccent,
            size: 32,
          ).animate(
            onPlay: (controller) => controller.repeat(),
          ).moveY(
            begin: 0,
            end: 10,
            duration: 1.seconds,
            curve: Curves.easeInOut,
          ).then().moveY(
            begin: 10,
            end: 0,
            duration: 1.seconds,
            curve: Curves.easeInOut,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 1500.ms);
  }



// Widget _buildScrollIndicator() {
  //   return Column(
  //     children: [
  //       const Text(
  //         "Scroll down to explore",
  //         style: TextStyle(
  //           color: Colors.white70,
  //           fontSize: 16,
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       const Icon(
  //         Icons.keyboard_arrow_down,
  //         color: AppColors.primaryAccent,
  //         size: 32,
  //       ).animate(
  //         onPlay: (controller) => controller.repeat(),
  //       ).moveY(
  //         begin: 0,
  //         end: 10,
  //         duration: 1.seconds,
  //         curve: Curves.easeInOut,
  //       ).then().moveY(
  //         begin: 10,
  //         end: 0,
  //         duration: 1.seconds,
  //         curve: Curves.easeInOut,
  //       ),
  //     ],
  //   ).animate().fadeIn(duration: 600.ms, delay: 1500.ms);
  // }
}
