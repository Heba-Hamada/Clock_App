import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/clockapp/menuType.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? imageSource;
  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenuo(MenuInfo menuoInfo) {
    this.menuType = menuoInfo.menuType;
    this.title = menuoInfo.title;
    this.imageSource = menuoInfo.imageSource;
    notifyListeners();
  }
}
