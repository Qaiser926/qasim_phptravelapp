import 'package:get/get.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';

class HomeBindingPage extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(
      HomeController(),
    );
  }
}
