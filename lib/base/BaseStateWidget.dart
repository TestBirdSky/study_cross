import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/base/BaseController.dart';
import 'package:study_flutter/log.dart';

abstract class BaseStateWidget<T extends BaseController>
    extends StatelessWidget {
   BaseStateWidget({super.key});
  @protected
  late T controller ;

  @override
  Widget build(BuildContext context) {
    controller=Get.put(initController());
    return initWidget(context);
  }

  @protected
  T initController();

  @protected
  Widget initWidget(BuildContext context);
}
