import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SomeSpace on num {
  Widget hSpace() => SizedBox(height: toDouble().h);
  Widget wSpace() => SizedBox(width: toDouble().w);
}