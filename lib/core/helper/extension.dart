import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Navigation on BuildContext {
  Future pushNamed(String route) {
    return Navigator.pushNamed(this, route);
  }

  void pop() => Navigator.pop(this);
}

extension SpaceExtension on num {
  SizedBox get horizontalSpace => SizedBox(width: toDouble().w);

  SizedBox get verticalSpace => SizedBox(height: toDouble().h);
}
