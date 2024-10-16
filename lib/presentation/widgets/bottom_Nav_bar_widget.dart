// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo/logic/cubit/todo_cubit/todo_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.todoCubit,
  });

  final TodoCubit todoCubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: todoCubit.currentIndex,
      onTap: (index) {
        todoCubit.changeBottomNavigationBarIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Tasks',
          icon: Icon(Icons.menu),
        ),
        BottomNavigationBarItem(
          label: 'Done',
          icon: Icon(Icons.check_circle_outline),
        ),
        BottomNavigationBarItem(
          label: 'Archived',
          icon: Icon(Icons.archive_outlined),
        ),
      ],
    );
  }
}
