import 'package:test_task/commons/theme_helper.dart';

getStatusColor(String status) {
  switch (status) {
    case 'Status.ALIVE':
      return ThemeHelper.green;

    case 'Status.DEAD':
      return ThemeHelper.red;

    default:
      return ThemeHelper.black;
  }
}