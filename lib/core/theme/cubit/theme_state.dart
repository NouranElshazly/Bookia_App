part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ChangedState extends ThemeState {
  final ThemeData theme;
  ChangedState({required this.theme});
}
