import 'package:flutter/material.dart';

import 'package:flutter_application_2/clockapp/AlarmPage.dart';
import 'package:flutter_application_2/clockapp/ColockPage.dart';
import 'package:flutter_application_2/clockapp/Timmer/countdown-page.dart';
import 'package:flutter_application_2/clockapp/coutemdata.dart';
import 'package:flutter_application_2/clockapp/data.dart';
import 'package:flutter_application_2/clockapp/menuType.dart';
import 'package:flutter_application_2/clockapp/menu_int.dart';
import 'package:flutter_application_2/clockapp/stopWatch/stopWatch.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //stopWatch -------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(
            color: CustomColors.dividerColor,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock)
                  return ClockPage();
                else if (value.menuType == MenuType.alarm)
                  return AlarmPage();
                else if (value.menuType == MenuType.timer)
                  return CountdownPage();
                else if (value.menuType == MenuType.stopwatch)
                  return stopwatch();
                else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming Tutorial\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? CustomColors.menuBackgroundColor
              : CustomColors.pageBackgroundColor,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenuo(currentMenuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                currentMenuInfo.imageSource!,
                scale: 1.5,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                    fontFamily: 'avenir',
                    color: CustomColors.primaryTextColor,
                    fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
