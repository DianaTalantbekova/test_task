import 'package:test_task/commons/theme_helper.dart';

getStatusColor(String status) {
  switch (status) {
    case 'Alive':
      return ;

    case 'Dead':
      return ThemeHelper.red;

    default:
      return ThemeHelper.black;
  }
}