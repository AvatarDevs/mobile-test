import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superformula_test/core/app/routes/routes.dart';
import 'package:superformula_test/modules/home/components/flow_action_button/flow_button_delegate.dart';

class FlowButton extends StatefulWidget {
  const FlowButton({Key? key}) : super(key: key);

  @override
  State<FlowButton> createState() => _FlowButtonState();
}

class _FlowButtonState extends State<FlowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  final List<IconData> _icons = <IconData>[
    Icons.menu,
    Icons.camera_alt,
    Icons.qr_code,
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        color: Colors.red,
        child: Flow(
          delegate: FlowButtonDelegate(myAnimation: controller),
          children:
              _icons.map<Widget>((IconData icon) => _buildItem(icon)).toList(),
        ),
      ),
    );
  }

  animate() {
    controller.status == AnimationStatus.completed
        ? controller.reverse()
        : controller.forward();
  }

  Widget _buildItem(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: RawMaterialButton(
        fillColor: Colors.cyan,
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size.square(50.0)),
        onPressed: () {
          animate();
          mapIconToRoute(icon);
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

  mapIconToRoute(IconData icon) {
    if (icon == Icons.camera_alt) {
      Get.toNamed(Routes.Scan);
    } else if (icon == Icons.qr_code) {
      Get.toNamed(Routes.QrCode);
    }
  }
}
