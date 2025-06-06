import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final String id;
  final String title;
  final int index;

  const Section({
    required this.id,
    required this.title,
    required this.index,
  });

  @override
  List<Object> get props => [id, title, index];
}

class AppSections {
  static const Section home = Section(
    id: 'home',
    title: 'Home',
    index: 0,
  );
  
  static const Section about = Section(
    id: 'about',
    title: 'About',
    index: 1,
  );
  
  static const Section projects = Section(
    id: 'projects',
    title: 'Projects',
    index: 2,
  );
  
  static const Section skills = Section(
    id: 'skills',
    title: 'Skills',
    index: 3,
  );
  
  static const Section experience = Section(
    id: 'experience',
    title: 'Experience',
    index: 4,
  );
  
  static const Section contact = Section(
    id: 'contact',
    title: 'Contact',
    index: 5,
  );
  
  static const List<Section> all = [
    home,
    about,
    projects,
    skills,
    experience,
    contact,
  ];
}
