import 'package:flutter/material.dart';

import 'package:flutter_application_2/clockapp/HompePage.dart';
import 'package:flutter_application_2/clockapp/menuType.dart';
import 'package:flutter_application_2/clockapp/menu_int.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  runApp(MyAppClock());
}

class MyAppClock extends StatelessWidget {
  const MyAppClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuInfo>(
        create: ((context) => MenuInfo(MenuType.clock)),
        child: (MaterialApp(
          home: HomePage(),
        )));
  }
}
