import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/view/screen/archive_screen.dart';
import '../../../presentation/view/screen/done_task_screen.dart';
import '../../../presentation/view/screen/new_task_screen.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  static TodoCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    const NewTaskScreen(),
    const DoneTaskScreen(),
    const ArchivedScreen(),
  ];
  List<String> titles = [
    'New Task',
    'Done Task',
    'Archive Task',
  ];

  int currentIndex = 0;
  void changeBottomNavigationBarIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationBarState());
  }

  bool isButtonSheetShown = false;
  IconData fabIcon = Icons.pending_actions;

  void changeIcon({
    required bool isShow,
    required IconData icon,
  }) {
    isButtonSheetShown = isShow;
    fabIcon = icon;
    emit(ChangeIconBottomNavigationBarState());
  }
}
