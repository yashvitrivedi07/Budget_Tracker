import 'package:get/get.dart';

class CategoryController extends GetxController {
  List categories = [
    "Insurance",
    "Utilities",
    "Housing",
    "Transportation",
    "Entertainment",
    "Health",
    "Debt payments",
    "Debt",
    "Groceries",
    "Personal care",
    "Babysitter",
    "Food",
    "Mortgage",
    "Pets",
    "Savings",
    "Cellphone",
    "Gym",
    "Retirement",
    "Subscriptions",
    "Childcare costs",
    "Clothing",
    "Emergency fund",
    "Gas",
    "Other"
  ];

  RxBool isselected = false.obs;
  RxString category = "".obs;

  void getData({required String value}) {
    isselected.value = true;
    category.value = value;
  }
}
