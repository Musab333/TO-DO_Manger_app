import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../logic/cubit/db_local_cubit/db_functions_cubit.dart';
import '../../widgets/card_task_build.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DbFunctionsCubit, DbFunctionsState>(
      builder: (context, state) {
        var dbCubit = DbFunctionsCubit.get(context).newTasks;
        return ConditionalBuilder(
          condition: dbCubit.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (
              context,
              index,
            ) =>
                taskItemBuild(
              dbCubit[index],
              context,
            ),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
              height: 2,
            ),
            itemCount: dbCubit.length,
          ),
          fallback: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/images/onboarding_3.svg',
                    height: 400,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 80.0),
                  child: Text(
                    'No Tasks Yet, Add Some Tasks',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
