import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/base/BaseController.dart';
import 'package:study_flutter/base/BaseStateWidget.dart';

class ListNote extends BaseStateWidget<ListNoteC> {
  @override
  ListNoteC initController() => ListNoteC();

  @override
  Widget initWidget(BuildContext context) {
    final list = [
      _item("100jijij\njjjj\njijij\njjjj\njijij\njjjj\n"),
      _item("100jijij\njjjj\njijij\njjjj\njijij\njjjj\n\njjjj\njijij\njjjj\njijij\njjjj\n"),
      _item("100jijij\njjjj\njijij\njjjj\njijij\njjjj\njjj\njijij\njjjj\n"),
      _item("100jijij\njjjj\njijij\njjjj\njijij\njjjj\njjj\njijij\njjjj\njjj\njijij\njjjj\njjj\njijij\njjjj\n"),
    ];
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: list,
        ),
      ],
    );
  }

  Widget _item(String te) {
    return IntrinsicHeight(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("time"),
                Container(
                  width: 3.w,
                  height: 10.h,
                  color: Colors.amberAccent,
                ),
                Text("20-1"),
                Expanded(
                  child: Container(
                    width: 3.w,
                    color: Colors.amberAccent,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.white10,
              child: Text(te),
            )
          ],
        ),
      ),
    );
  }
}

class ListNoteC extends BaseController {}
