// Clear TextField
import 'package:flutter/material.dart';

void cleanTextFormFieldWidget(
  TextEditingController titleController,
  timeController,
  dateController,
) {
  titleController.clear();
  timeController.clear();
  dateController.clear();
}

// Check in is Empty TextField
bool isEmptyTextField(
  TextEditingController titleController,
  timeController,
  dateController,
) {
  if (titleController.text.isEmpty &&
      timeController.text.isEmpty &&
      dateController.text.isEmpty) {
    return true;
  }
  return false;
}
