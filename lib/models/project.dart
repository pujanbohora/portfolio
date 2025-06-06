import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? link;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.link,
  });

  @override
  List<Object?> get props => [id, title, description, imageUrl, technologies, link];
}

class ProjectData {
  static final List<Project> projects = [
    const Project(
      id: 'snap-receipts',
      title: 'SnapReceipts',
      description: 'Mobile and web app for scanning receipts and auto-categorizing expenses using OCR and AI.',
      imageUrl: 'assets/images/snap_receipts.png',
      technologies: ['Flutter', 'Spring Boot', 'Tesseract OCR', 'Machine Learning'],
    ),

    const Project(
      id: 'ekurakani',
      title: 'eKurakani',
      description: 'B2B counseling platform with Zoom SDK integration, session booking, and digital payments.',
      imageUrl: 'assets/images/ekurakani.png',
      technologies: ['Flutter', 'Django', 'Zoom SDK', 'eSewa'],
    ),

    const Project(
      id: 'story-app',
      title: 'Story',
      description: 'Location-based story sharing app with swipeable UI and geo-filtered content discovery.',
      imageUrl: 'assets/images/story.png',
      technologies: ['Flutter', 'Django', 'Location Services'],
    ),

    const Project(
      id: 'bookmark-manager',
      title: 'Bookmark Manager',
      description: 'Browser extension with Supabase backend for cross-device bookmark synchronization and organization.',
      imageUrl: 'assets/images/bookmark_manager.png',
      technologies: ['JavaScript', 'Supabase', 'Browser Extension API', 'React'],
    ),


  ];
}
