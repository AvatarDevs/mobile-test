import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superformula_test/modules/scan/views/scan_view_mobile.dart';

class ScanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.responsiveValue(
      mobile: ScanViewMobile(),
    )!;
  }
}
