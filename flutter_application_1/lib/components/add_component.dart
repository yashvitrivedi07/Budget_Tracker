import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/category_controller.dart';
import 'package:flutter_application_1/helper/data_base_helper.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddComponent extends StatelessWidget {
  AddComponent({super.key});
  CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheet(
                onClosing: () {
                  Get.back();
                },
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownMenu(
                        onSelected: (value) {
                          controller.isselected.value = true;
                          controller.category?.value = value;
                        },
                        dropdownMenuEntries: controller.categories.map((item) {
                          return DropdownMenuEntry(value: item, label: item);
                        }).toList(),
                      ),
                      Visibility(
                          visible: controller.isselected.value == true,
                          child: IconButton(
                              onPressed: () {
                                DataBaseHelper.dbh
                                    .insertData(controller.category!.value);
                              },
                              icon: const Icon(Icons.add)))
                    ],
                  );
                },
              );
            },
          );
        },
        child: Image.asset(
          'assets/images/calculator_15256701.png',
          height: 100,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
