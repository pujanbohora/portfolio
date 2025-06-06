part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToSection extends NavigationEvent {
  final Section section;

  const NavigateToSection(this.section);

  @override
  List<Object> get props => [section];
}
