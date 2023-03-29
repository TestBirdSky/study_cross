import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomMenu extends StatelessWidget {
  final ValueChanged<int>? onTap;
  int index;

  BottomMenu(this.index, this.onTap) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.h,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(12.w))),
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                onTap?.call(0);
              },
              child: Icon(
                Icons.home,
                color: getColor(0),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                onTap?.call(1);
              },
              child: Icon(
                Icons.search,
                color: getColor(1),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                onTap?.call(2);
              },
              child: Icon(
                Icons.person,
                color: getColor(2),
              ),
            )),
          ],
        ));
  }

  Color getColor(int curIndex) {
    if (index == curIndex) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }
}
