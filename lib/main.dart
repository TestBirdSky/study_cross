import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:study_flutter/base/BaseController.dart';
import 'package:study_flutter/base/BaseStateWidget.dart';
import 'package:study_flutter/dialog.dart';
import 'package:study_flutter/log.dart';

void main() => runApp(MyApp2());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyHomePage(title: 'Home'),
    MyHomePage(title: 'Search'),
    MyHomePage(title: 'Profile')
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation Bar Demo'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}

class MyApp2 extends BaseStateWidget<MyAppC> {
  MyApp2({super.key});

  @override
  MyAppC initController() => MyAppC();
  late List<Widget> _children = [
    TestPage(title: 'Home2'),
    GetViewText(),
    TestDatePicker()
  ];

  @override
  Widget initWidget(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Bottom Navigation Bar Demo2',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
              appBar: AppBar(
                title: Text('Bottom Navigation Bar Demo'),
              ),
              body: GetBuilder<MyAppC>(
                id: 'page',
                builder: (c) {
                  return IndexedStack(
                    index: controller.curIndex,
                    children: _children,
                  );
                },
              ),
              bottomNavigationBar: GetBuilder<MyAppC>(
                id: 'page',
                builder: (c) {
                  return BottomNavigationBar(
                    currentIndex: controller.curIndex,
                    onTap: controller.onTabTapped,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}

class MyAppC extends BaseController {
  var curIndex = 0;
  var isChecked = false;

  void onTabTapped(int index) {
    curIndex = index;
    update(['page']);
  }
}

class TestPage extends BaseStateWidget<TestC> {
  final String title;

  TestPage({Key? key, required this.title}) : super(key: key);

  @override
  TestC initController() => TestC();

  @override
  Widget initWidget(BuildContext context) {
    logger.i("title$title");
    return ListView(children: <Widget>[
      Container(
        height: 50.h,
        child: PageView(
          controller: PageController(initialPage: 0),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(width: 1.w),
              ),
              child: Column(
                children: [Text("data111")],
              ),
              height: 50.h,
            ),
            Container(
              child: Column(
                children: [Text("data2222")],
              ),
              height: 50.h,
            ),
          ],
        ),
      ),
      Container(
        height: 50.h,
        child: PageView(
          controller: null,
          children: [
            Container(
              child: Column(
                children: [Text("data111")],
              ),
              height: 50.h,
            ),
            Container(
              child: Column(
                children: [Text("data2222")],
              ),
              height: 50.h,
            ),
          ],
        ),
      ),
      Container(
        height: 50.h,
        child: PageView(
          controller: PageController(initialPage: 1),
          children: [
            Container(
              child: Column(
                children: [Text("data111")],
              ),
              height: 50.h,
            ),
            Container(
              child: Column(
                children: [Text("data2222")],
              ),
              height: 50.h,
            ),
          ],
        ),
      ),
      Container(
        height: 50.h,
        child: PageView(
          controller: PageController(initialPage: 1),
          children: [
            Container(
              child: Column(
                children: [Text("data111")],
              ),
              height: 50.h,
            ),
            Container(
              child: Column(
                children: [Text("data2222")],
              ),
              height: 50.h,
            ),
          ],
        ),
      ),
      Slidable(
          child: Row(
            children: [
              Container(
                height: 30.h,
                child: Text(title),
              )
            ],
          ),
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              //左侧按钮列表
              SlidableAction(
                onPressed: _showSnackBar('111'),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              CustomSlidableAction(
                onPressed: _showSnackBar('custom'),
                autoClose: true,
                child: Text("322211111122227777777777777"),
              )
              // SlidableAction(
              //   onPressed: _showSnackBar('Share'),
              //   backgroundColor: Color(0xFF21B7CA),
              //   foregroundColor: Colors.white,
              //   icon: Icons.share,
              //   label: 'Share',
              // ),
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              //左侧按钮列表
              SlidableAction(
                onPressed: _showSnackBar('222'),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: _showSnackBar('Share'),
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ))
    ]);
    ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 300)),
        Text("item1"),
        Text("item2"),
        Text("item3"),
        Text("item4"),
        Text("item133"),
        Padding(padding: EdgeInsets.only(top: 300)),
        Text("item2"),
        Text("item3"),
        Text("item55"),
        Text("item1"),
        Padding(padding: EdgeInsets.only(top: 300)),
        Text("item2"),
        Text("item3"),
        Text("item4"),
        Padding(padding: EdgeInsets.only(top: 300)),
        Text("item133"),
        Text("item2"),
        Text("item3"),
        Padding(padding: EdgeInsets.only(top: 300)),
        Text("item55"),
      ],
    );
  }
}

_showSnackBar(String s) {
  logger.i("s$s");
}

var _listView = [
  Container(
    height: 50,
    color: Colors.amber,
    child: Text("item133333"),
  ),
  Text("item2"),
  Text("item3"),
  Text("item1"),
  Text("item2"),
  Text("item3"),
  Text("item4"),
  Text("item133"),
  Text("item2"),
  Text("item3"),
  Text("item4"),
  Text("item133"),
];

class TestC extends BaseController {
  var isChecked = false;
}

class GetViewText extends GetView<MyAppC> {
  @override
  final String tag = "MyAppC";

  @override
  Widget build(BuildContext context) {
    return
        //   Ink(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.blue, Colors.green], // 渐变色
        //     ),
        //     borderRadius: BorderRadius.circular(8), // 圆角
        //   ),
        //   child: InkWell(
        //     onTap: () {
        //       // 处理点击事件
        //     },
        //     splashColor: Colors.white.withOpacity(0.3), // 设置墨水的颜色和透明度
        //     child: Container(
        //       padding: EdgeInsets.all(16),
        //       child: Text('Click me!', style: TextStyle(color: Colors.white)),
        //     ),
        //   ),
        // );
        Scaffold(
            body: Column(
      children: [
        Container(
          height: 56.h,
          color: Colors.blue, // 设置背景色
          child: InkResponse(
            onTap: () {},
            child: Ink(
              color: Colors.red.withOpacity(0.3),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Row(children: [
                  GetBuilder<MyAppC>(
                      id: 'page',
                      builder: (c) {
                        return Expanded(child: Text('GetView${c.curIndex}'));
                      }),
                  GetBuilder<MyAppC>(
                      id: 'page',
                      builder: (c) {
                        return Container(
                          height: 40.h,
                          width: 60.w,
                          child: Switch(
                              value: c.isChecked,
                              onChanged: (onChanged) {
                                c.isChecked = onChanged;
                                c.update(['page']);
                              }),
                        );
                      }),
                  GetBuilder<MyAppC>(
                      id: 'page',
                      builder: (c) {
                        return Container(
                          height: 40.h,
                          width: 60.w,
                          child: CupertinoSwitch(
                              value: c.isChecked,
                              activeColor: Colors.amber,
                              trackColor: Colors.red,
                              onChanged: (onChanged) {
                                c.isChecked = onChanged;
                                if (onChanged)
                                  DialogUtil.show();
                                else
                                  DialogUtil.dismiss();
                                c.update(['page']);
                              }),
                        );
                      }),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20.w,
                  )
                ]),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class TestDatePicker extends BaseStateWidget<DatePickerC> {
  @override
  DatePickerC initController() => DatePickerC();

  @override
  Widget initWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                  height: 180,
                  width: 200,
                  child: GetBuilder<DatePickerC>(
                      id: 'pick',
                      builder: (c) {
                        return ScrollDatePicker(
                            selectedDate: controller.selected,
                            locale: Locale('zh'),
                            onDateTimeChanged: (DateTime value) {
                              controller.selected = value;
                              controller.update(['pick']);
                            });
                      }))),
          Wrap(
            spacing: 20.w,
            runSpacing: 10.w,
            children: _listView,
          )
        ],
      ),
    );
  }
}

class DatePickerC extends BaseController {
  var selected = DateTime.now();
}
