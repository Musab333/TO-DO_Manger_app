import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/show_dialog_dane_and_archive_custom.dart';

import '../../logic/cubit/db_local_cubit/db_functions_cubit.dart';
import '../../shared/styles/color_app.dart';

Widget taskItemBuild(Map model, context) {
  return Dismissible(
    key: Key(model['id'].toString()),
    background: Container(
      color: Colors.red,
      height: 1.0,
      child: const Row(
        children: [
          Icon(
            Icons.delete,
            color: secondColor,
            size: 50,
          ),
        ],
      ),
    ),
    onDismissed: (direction) => DbFunctionsCubit.get(context).deleteData(
      id: model['id'],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            height: 118.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: secondColor,
              boxShadow: [
                BoxShadow(
                  color: thirdColor,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 70,
                          width: 80,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${model['time']}',
                              style: const TextStyle(
                                color: secondColor,
                                fontSize: 16,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${model['title']}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                '${model['date']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Cairo',
                                  color: primaryColor,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        IconButton(
                          onPressed: () {
                            showDialogDaneAndArchiveCustom(
                              context,
                              icon: Icons.task_alt,
                              pathImage: 'assets/images/img_checked.png',
                              text: 'ارئع, لقد اتممت مهمتك بنجاح 👍',
                              textButton: 'حسنآ',
                              onPressed: () {
                                DbFunctionsCubit.get(context).updateData(
                                    status: 'done', id: model['id']);
                                Navigator.pop(context, 'حسنآ');
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.check_circle,
                            color: primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialogDaneAndArchiveCustom(
                              context,
                              icon: Icons.archive,
                              pathImage: 'assets/images/img_archived.png',
                              text: 'هل تريد الاحتفاظ بهذهي المهمه ؟ 🙂',
                              textButton: 'نعم',
                              onPressed: () {
                                DbFunctionsCubit.get(context).updateData(
                                    status: 'archive', id: model['id']);
                                Navigator.pop(context, 'نعم');
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.archive_rounded,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
