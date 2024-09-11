import 'package:get/get.dart';
import 'package:money/data/model/workshop.dart';
import 'package:money/data/source/source_workshop.dart';

class CWorkshop extends GetxController {
  final _listWorkshop = <Workshop>[].obs;
  List<Workshop> get listWorkshop => _listWorkshop.value;

  getListWorkshop() async {
    _listWorkshop.value = await SourceWorkshop.getWorkshop();
    update();
  }

  Future<bool> createWorkshop({
    required String name,
    required String ownerName,
    required String address,
    required String email,
    required String workshopName,
    required String primaryNumber,
    required String secondaryNumber,
    required String whatsappNumber,
  }) async {
    final result = await SourceWorkshop.createWorkshop(
      name: name,
      ownerName: ownerName,
      address: address,
      email: email,
      workshopName: workshopName,
      primaryNumber: primaryNumber,
      secondaryNumber: secondaryNumber,
      whatsappNumber: whatsappNumber,
    );

    if (result) {
      await getListWorkshop(); // Refresh the list after creating a new workshop
    }

    return result;
  }

  @override
  void onInit() {
    getListWorkshop();
    super.onInit();
  }
}
