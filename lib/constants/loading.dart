import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
      title: "just a minute",
      content: Center(
          child:
              CircularProgressIndicator(strokeWidth: 0, color: Colors.black)),
      barrierDismissible: false);
}

dismissLoadingWidget() {
  Get.back();
}
