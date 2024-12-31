import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/add_component.dart';
import 'package:flutter_application_1/components/over_all_component.dart';
import 'package:flutter_application_1/controller/navigation_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List components = [const OverAllComponent(), const AddComponent()];
    NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Budget Tracker"),
      ),
      body: Obx(
        () {
          return components[controller.index.value];
        },
      ),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
            selectedIndex: controller.index.value,
            onDestinationSelected: (index) {
              controller.index.value = index;
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.add), label: "add"),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: "setting"),
            ]);
      }),
    );
  }
}
