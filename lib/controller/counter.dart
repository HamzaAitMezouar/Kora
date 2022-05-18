import 'package:get/get.dart';

class counter extends GetxController {
  late RxInt countere = 0.obs;
  increament() => countere = countere + 2;
}
