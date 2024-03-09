import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Statusbar {
  void trasparent_statusbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark)
        //color set to transperent or set your own color
        );
  }

  void trasparentStatusbarIsNormalScreen() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness:
          Brightness.light ,
      statusBarColor: Colors.black,
      statusBarBrightness:  Brightness.dark
    ));
  }
}
