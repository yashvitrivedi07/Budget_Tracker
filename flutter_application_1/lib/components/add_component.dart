import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddComponent extends StatelessWidget {
  const AddComponent({super.key});

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
                    children: [Text("data")],
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
