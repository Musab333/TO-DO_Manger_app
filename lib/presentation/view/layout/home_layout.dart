import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/function/clean_and_isempty_textformfield.dart';
import 'package:todo/function/isnot_empty_textfield.dart';
import 'package:todo/presentation/widgets/bottom_Nav_bar_widget.dart';

import '../../../logic/cubit/db_local_cubit/db_functions_cubit.dart';
import '../../../logic/cubit/todo_cubit/todo_cubit.dart';
import '../../../shared/styles/color_app.dart';
import '../../widgets/show_dialog_custom.dart';
import '../../widgets/text_form_field_widget.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    showDialogCustom(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DbFunctionsCubit()..createDatabase(),
        ),
        BlocProvider(
          create: (context) => TodoCubit(),
        ),
      ],
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state is InsertNewTaskInDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var todoCubit = TodoCubit.get(context);
          var dbCubit = DbFunctionsCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: appBarWidget(todoCubit),
            body: todoCubit.screen[todoCubit.currentIndex],
            floatingActionButton:
                floatingActionButton(todoCubit, context, dbCubit),
            bottomNavigationBar:
                BottomNavigationBarWidget(todoCubit: todoCubit),
          );
        },
      ),
    );
  }

  Widget floatingActionButton(
      TodoCubit todoCubit, BuildContext context, DbFunctionsCubit dbCubit) {
    return FloatingActionButton(
      onPressed: () {
        if (todoCubit.isButtonSheetShown) {
          // Check in is Empty TextField
          if (isEmptyTextField(
            titleController,
            timeController,
            dateController,
          )) {
            Navigator.pop(context);
            todoCubit.isButtonSheetShown = false;
          }
          // Check validate is Not Empty TextFormField
          else if (isNotEmptyTextField(
            titleController,
            timeController,
            dateController,
          )) {
            formKey.currentState!.validate();
            todoCubit.isButtonSheetShown = false;
          } else {
            //--> Call Insert Function
            dbCubit.insertToDatabase(
              title: titleController.text,
              time: timeController.text,
              date: dateController.text,
            );
            Navigator.pop(context);
            cleanTextFormFieldWidget(
              titleController,
              timeController,
              dateController,
            );
          }
        } else {
          scaffoldKey.currentState!
              .showBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                elevation: 20.0,
                backgroundColor: primaryColor,
                (context) => Container(
                  width: double.infinity,
                  //color: primaryColor,
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: textFormFieldWidget(context),
                  ),
                ),
              )
              .closed
              .then((value) {
            todoCubit.changeIcon(
              isShow: false,
              icon: Icons.pending_actions,
            );
          });
          todoCubit.changeIcon(
            isShow: true,
            icon: Icons.edit,
          );
        }
      },
      backgroundColor: primaryColor,
      child: Icon(
        todoCubit.fabIcon,
        color: secondColor,
      ),
    );
  }

  AppBar appBarWidget(TodoCubit todoCubit) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        todoCubit.titles[todoCubit.currentIndex],
        style: const TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: secondColor,
        ),
      ),
    );
  }

  Column textFormFieldWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormFieldWidget(
          textController: titleController,
          text: 'Title Task',
          keyPadType: TextInputType.text,
          prefixIcon: const Icon(Icons.title, color: primaryColor),
          isPassword: false,
          validate: (value) {
            if (value!.isEmpty) {
              return 'Title must not be empty';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 15.0,
        ),
        TextFormFieldWidget(
          textController: timeController,
          text: 'Time Task',
          keyPadType: TextInputType.number,
          isPassword: false,
          prefixIcon:
              const Icon(Icons.watch_later_outlined, color: primaryColor),
          onTop: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              // ignore: use_build_context_synchronously
              timeController.text = value!.format(context).toString();
            });
          },
          validate: (value) {
            if (value!.isEmpty) {
              return 'Time must not be Empty';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 15.0,
        ),
        TextFormFieldWidget(
          textController: dateController,
          text: 'Date Task',
          keyPadType: TextInputType.datetime,
          isPassword: false,
          prefixIcon:
              const Icon(Icons.date_range_outlined, color: primaryColor),
          onTop: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.parse('2099-12-31'),
            ).then((value) {
              dateController.text = DateFormat.yMMMd().format(value!);
            });
          },
          validate: (value) {
            if (value!.isEmpty) {
              return 'Date must not be Empty';
            }
            return null;
          },
        ),
      ],
    );
  }
}
