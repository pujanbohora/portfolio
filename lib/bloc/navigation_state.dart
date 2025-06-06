part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final Section currentSection;

  const NavigationState({required this.currentSection});

  @override
  List<Object> get props => [currentSection];
}
