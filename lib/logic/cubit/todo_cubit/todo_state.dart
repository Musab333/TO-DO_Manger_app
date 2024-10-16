part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class ChangeBottomNavigationBarState extends TodoState {}

class ChangeIconBottomNavigationBarState extends TodoState {}
