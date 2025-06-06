import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/bloc/navigation_bloc.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:pujan_portfolio/models/section.dart';
import 'package:pujan_portfolio/screens/sections/about_section.dart';
import 'package:pujan_portfolio/screens/sections/contact_section.dart';
import 'package:pujan_portfolio/screens/sections/experience_section.dart';
import 'package:pujan_portfolio/screens/sections/hero_section.dart';
import 'package:pujan_portfolio/screens/sections/projects_section.dart';
import 'package:pujan_portfolio/screens/sections/skills_section.dart';
import 'package:pujan_portfolio/widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    final navigationBloc = context.read<NavigationBloc>();

    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page >= 0 && page < AppSections.all.length) {
        final section = AppSections.all[page];
        if (navigationBloc.state.currentSection != section) {
          navigationBloc.add(NavigateToSection(section));
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocListener<NavigationBloc, NavigationState>(
            listener: (context, state) {
              _pageController.animateToPage(
                state.currentSection.index,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOutCubic,
              );
            },
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              children: const [
                HeroSection(),
                AboutSection(),
                ProjectsSection(),
                SkillsSection(),
                ExperienceSection(),
                ContactSection(),
              ],
            ),
          ),
          const PortfolioNavigationBar(),
          // _buildMouseTracker(),
        ],
      ),
    );
  }
}


