import 'package:get/get.dart';
import 'package:superformula_test/core/data/repositories/qr_code_repo/qr_repo.dart';
import 'package:superformula_test/core/data/repositories/qr_code_repo/qr_repo_interface.dart';

class ScanBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<QrRepositoryInterface>(QrRepository());
  }
}
