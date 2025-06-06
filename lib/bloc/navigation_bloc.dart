import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pujan_portfolio/models/section.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(currentSection: AppSections.home)) {
    on<NavigateToSection>(_onNavigateToSection);
  }

  void _onNavigateToSection(
    NavigateToSection event,
    Emitter<NavigationState> emit,
  ) {
    emit(NavigationState(currentSection: event.section));
  }
}
