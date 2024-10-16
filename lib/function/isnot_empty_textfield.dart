// Check validate is Not Empty TextFormField
import 'package:flutter/widgets.dart';

bool isNotEmptyTextField(
  TextEditingController titleController,
  timeController,
  dateController,
) {
  if (titleController.text.isNotEmpty &&
      timeController.text.isEmpty &&
      dateController.text.isEmpty) {
    return true;
  } else if (titleController.text.isNotEmpty &&
      timeController.text.isNotEmpty &&
      dateController.text.isEmpty) {
    return true;
  } else if (titleController.text.isEmpty &&
      timeController.text.isEmpty &&
      dateController.text.isNotEmpty) {
    return true;
  } else if (titleController.text.isEmpty &&
      timeController.text.isNotEmpty &&
      dateController.text.isNotEmpty) {
    return true;
  }
  return false;
}
