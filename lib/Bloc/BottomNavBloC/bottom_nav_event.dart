part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

final class BottomNavSelectItem extends BottomNavEvent {
  final int selectedInxdex;
  BottomNavSelectItem({
    required this.selectedInxdex,
  });
}

final class BottomNavReset extends BottomNavEvent {}
