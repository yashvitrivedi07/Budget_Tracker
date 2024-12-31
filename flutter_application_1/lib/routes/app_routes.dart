import 'package:flutter_application_1/views/home/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String home = '/';

  List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const HomePage(),
    )
  ];
}
