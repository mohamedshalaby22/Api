import 'package:fetch/Controller/bottom_bar.dart';
import 'package:fetch/Controller/movie_controller.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
    Get.lazyPut(() => BottomBar());
  }
}
