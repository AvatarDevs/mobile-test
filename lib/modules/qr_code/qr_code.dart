import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superformula_test/modules/qr_code/controllers/qr_code_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class QrCodeView extends GetView<QrCodeController> {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Code'),
      ),
      body:

          ///obx widget allows us to respond to state changes automagically
          controller.obx(
        (state) => Center(
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              children: [
                QrImage(data: state!.seed!),
                Text(state.expiresAt!),
                CountdownTimer(
                  endTime:
                      DateTime.parse(state.expiresAt!).millisecondsSinceEpoch +
                          1000 * 30,
                  widgetBuilder: (c, t) => Text("Valid for : ${t?.sec ?? 0}"),
                  onEnd: () => controller.onTimerEnd(),
                ),
              ],
            ),
          ),
        ),

        ///other optional parameters:
        // onEmpty:
        // onLoading: defaults to loading spinner
      ),
    );
  }
}
