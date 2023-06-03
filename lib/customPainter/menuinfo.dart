import 'package:flutter/widgets.dart';
import 'package:flutter_1/customPainter/enum.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? ImageSource;
  MenuInfo(this.menuType, {this.title, this.ImageSource});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.ImageSource = menuInfo.ImageSource;

    notifyListeners();
  }
}
