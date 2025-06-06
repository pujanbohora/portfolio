import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  final String title;
  final String organization;
  final String period;
  final List<String> description;
  final String? location;

  const Experience({
    required this.title,
    required this.organization,
    required this.period,
    required this.description,
    this.location,
  });

  @override
  List<Object?> get props => [title, organization, period, description, location];
}

class ExperienceData {
  static final List<Experience> experiences = [
    const Experience(
      title: "Flutter Developer",
      organization: "Digi Technology Pvt. Ltd.",
      period: "July 2022 – July 2024",
      location: "Kathmandu, Nepal",
      description: [
        "Led full-cycle development of SchoolWorksPro and Gyapu Marketplace, growing user base by 20%",
        "Applied clean architecture and BLoC to ensure scalable, maintainable code",
        "Integrated Firebase (Auth, Firestore, Messaging) and 3rd-party payment SDKs (FonePay, eSewa)",
        "Optimized performance and reduced app startup time by 30%",
        "Set up CI/CD pipelines using Fastlane and GitHub Actions"
      ],
    ),

    const Experience(
      title: "Flutter Developer",
      organization: "Varosa Technology",
      period: "April 2022 – June 2022",
      location: "Kathmandu, Nepal",
      description: [
        "Built and maintained production-level Flutter app: Cycle",
        "Used dependency injection and repository pattern to improve scalability",
        "Wrote unit, widget, and integration tests achieving 50% coverage",
        "Conducted profiling using Flutter DevTools and native platform profilers"
      ],
    ),

    const Experience(
      title: "Flutter Developer Intern",
      organization: "Kurma Technology",
      period: "May 2019 – July 2019",
      location: "Kathmandu, Nepal",
      description: [
        "Assisted in developing reusable UI components using Material Design",
        "Integrated RESTful APIs and supported senior developers with clean architecture tasks",
        "Gained hands-on experience in Flutter app development and performance optimization"
      ],
    ),
  ];
}
