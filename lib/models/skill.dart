import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String name;
  final String category;
  final int proficiency;
  final String? icon;

  const Skill({
    required this.name,
    required this.category,
    required this.proficiency,
    this.icon,
  });

  @override
  List<Object?> get props => [name, category, proficiency, icon];
}
class SkillData {
  static const String flutterCategory = 'Flutter/Mobile';
  static const String aiMlCategory = 'AI/ML';
  static const String languagesCategory = 'Languages';
  static const String toolsCategory = 'Tools';

  static final List<Skill> skills = [
    // Flutter/Mobile
    const Skill(name: 'Flutter', category: flutterCategory, proficiency: 95),
    const Skill(name: 'Dart', category: flutterCategory, proficiency: 90),
    const Skill(name: 'Firebase (Auth, Firestore, Messaging)', category: flutterCategory, proficiency: 85),
    const Skill(name: 'REST API Integration', category: flutterCategory, proficiency: 90),
    const Skill(name: 'SwiftUi', category: flutterCategory, proficiency: 20),
    const Skill(name: 'Deep Linking', category: flutterCategory, proficiency: 80),
    const Skill(name: 'Multi-Flavors Architecture', category: flutterCategory, proficiency: 80),

    // AI/ML
    const Skill(name: 'Tesseract OCR', category: aiMlCategory, proficiency: 75),
    const Skill(name: 'Machine Learning', category: aiMlCategory, proficiency: 70),

    // Languages
    const Skill(name: 'Python', category: languagesCategory, proficiency: 90),
    const Skill(name: 'Dart', category: languagesCategory, proficiency: 90),
    const Skill(name: 'SQL (PostgreSQL)', category: languagesCategory, proficiency: 75),
    const Skill(name: 'HTML/CSS', category: languagesCategory, proficiency: 70),
    const Skill(name: 'JavaScript', category: languagesCategory, proficiency: 65),

    // Tools
    const Skill(name: 'Git/GitHub', category: toolsCategory, proficiency: 90),
    const Skill(name: 'Postman', category: toolsCategory, proficiency: 80),
    const Skill(name: 'Agile / Scrum', category: toolsCategory, proficiency: 85),
    const Skill(name: 'Mockito, Integration Testing', category: toolsCategory, proficiency: 80),
    const Skill(name: 'Riverpod, BLoC', category: toolsCategory, proficiency: 85),
  ];

  static List<String> get categories => [
    flutterCategory,
    aiMlCategory,
    languagesCategory,
    toolsCategory,
  ];
}
