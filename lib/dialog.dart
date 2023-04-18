import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_flutter/log.dart';

class DialogUtil {
  static void show() {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      Container(
        margin: EdgeInsets.all(30.w),
        child: ListView(
          children: [
            Container(
              height: 170.h,
              child: GestureDetector(
                child: Text(
                  'tt${Random().nextInt(299)}',
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                ),
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      color: Colors.black,
                      height: 50.h,
                      child: Text("data"),
                    ),
                    barrierColor: Color(0x00000000),
                  );
                },
              ),
            ),
            Container(
              height: 550.h,
              child: Text('tt${Random().nextInt(299)}'),
            ),
            Container(
              height: 50.h,
              child: Text('tt${Random().nextInt(299)}'),
            ),
            Container(
              height: 50.h,
              child: Text('tt${Random().nextInt(299)}'),
            ),
            Container(
              height: 50.h,
              child: Text('tt${Random().nextInt(299)}'),
            ),
            Container(
              height: 50.h,
              child: Text('tt${Random().nextInt(299)}'),
            ),
          ],
        ),
      ),
      barrierColor: Color(0x00000000),
      barrierDismissible: false,
    );
  }

  static void dismiss() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}

void dialog2() {
  String inputStr = "";
  bool isShowEdit = true;
  Get.dialog(
    Align(
      alignment: Alignment.center,
      child: StatefulBuilder(builder: (context, state) {
        // setState({});
        // state.
        final con = isShowEdit
            ? Container(
                height: 70.h,
                color: Colors.black12,
                child: TextField(
                  onChanged: (input) {
                    logger.i("$input");
                    inputStr = input;
                  },
                ),
              )
            : Container(
                height: 70.h,
                color: Colors.black12,
                child: Text("$inputStr"),
              );
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: Icon(Icons.clear),
              alignment: Alignment.topRight,
            ),
            con,
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      EasyLoading.showToast('$inputStr');
                      Get.back();
                    },
                    child: Text("btn")),
                TextButton(
                    onPressed: () {
                      state(() {
                        isShowEdit = false;
                      });
                    },
                    child: Text("btn")),
                TextButton(onPressed: () {}, child: Text("btn")),
              ],
            )
          ],
        );
      }),
    ),
    barrierColor: Color(0x00000000),
    // barrierDismissible: false,
  );
}
