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

Future<dynamic> dialog3() {
  final list = <Widget>[];
  for (int i = 0; i < 100; i++) {
    list.add(
      Container(
        child: Align(alignment: Alignment.center, child: Text('data$i')),
        height: 40.h,
      ),
    );
  }
  FixedExtentScrollController hourScrollController =
      FixedExtentScrollController(initialItem: 10);
  return Get.dialog(
    barrierColor: Color(0x00000000),
    barrierDismissible: true,
    Align(
      alignment: Alignment.bottomCenter,
      child:
      Container(
        height: 160.h,
        child: Column(
          children: [
            Container(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Text(
                        '取消',
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                        child: Text('',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black, fontSize: 18.sp))),
                    GestureDetector(
                      child: Text('确定',
                          style: TextStyle(
                              color: Color(0xffFEC693), fontSize: 16.sp)),
                      onTap: () {
                        Get.back(result:hourScrollController.selectedItem);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120.h,
              color: Colors.grey.shade100,
              child: Stack(
                children: [
                  Align(
                    child: Container(
                      height: 40.h,
                      color: Colors.grey,
                    ),
                  ),
                  ListWheelScrollView(
                      controller: hourScrollController,
                      physics: FixedExtentScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemExtent: 40.h,
                      children: list,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
