import 'package:flutter/material.dart';

Future<DateTime?> commonDatePicker(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now().add(Duration(days: 365)),
  );
}
