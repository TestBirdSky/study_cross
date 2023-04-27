import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_flutter/base/BaseController.dart';
import 'package:study_flutter/base/BaseStateWidget.dart';
import 'package:study_flutter/log.dart';

class ListPage extends BaseStateWidget<Controller> {
  var selectId = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Controller initController() => Controller();

  @override
  Widget initWidget(BuildContext context) {
    // pageController.pa
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<Controller>(
              id: "title",
              builder: (c) {
                return Container(
                  height: 50.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: selectId == 0 ? Colors.blue : Colors.transparent,
                        child: TextButton(
                          onPressed: () {
                            selectId = 0;
                            pageController.animateTo(
                                MediaQuery.of(context).size.width * selectId,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear);
                          },
                          child: Text('page1$selectId'),
                        ),
                      ),
                      Container(
                        color: selectId == 1 ? Colors.blue : Colors.transparent,
                        child: TextButton(
                          onPressed: () {
                            selectId = 1;
                            pageController.animateTo(
                                MediaQuery.of(context).size.width * selectId,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear);
                          },
                          child: Text('page2$selectId'),
                        ),
                      ),
                      Container(
                        color: selectId == 2 ? Colors.blue : Colors.transparent,
                        child: TextButton(
                          onPressed: () {
                            selectId = 2;
                            pageController.animateTo(
                                MediaQuery.of(context).size.width * selectId,
                                duration: const Duration(milliseconds: 10),
                                curve: Curves.linear);
                          },
                          child: Text('page3$selectId'),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Expanded(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              selectId = index;
              controller.update(['title']);
            },
            children: [
              Container(
                height: 500.h,
                child: Text('page1\n${Random().nextInt(100)}'),
              ),
              Container(
                height: 500.h,
                child: Text('page2\n${Random().nextInt(100)}'),
              ),
              Container(
                height: 500.h,
                child: Text('page3\n${Random().nextInt(100)}'),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class Controller extends BaseController {}
