import 'package:get/get.dart';

class AppController extends GetxController {
  var isDarkMode = false.obs;
  void changeTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  RxInt tabBarIndex = 0.obs;
}
