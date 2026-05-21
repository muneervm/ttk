import 'package:get/get.dart';
import 'package:ttk/src/models/order.dart';
import 'package:ttk/src/modules/landing/landing_controller.dart';
import 'package:ttk/src/resources/hospital_repository.dart';
import 'package:ttk/src/utils/app_exception.dart';

class HomeController extends GetxController {

  final LandingController _landingController = Get.find();
  final orders = <Order>[].obs;

  final _hospitalRepository =  HospitalRepository();

  final busy = false.obs;
  final message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  void getOrders() async{
    busy(true);
    try{
      final response = await _hospitalRepository.getOrders();
      if(response.success){
        orders(response.orders);
        if(orders.isEmpty){
          message(response.message);
        }else{
          message('');
        }
      }
    }catch(_){
      if(_ is UnauthorisedException){
        Get.find<LandingController>().logout();
    }
      print(_.toString());
      message("No sales!");
    }finally{
      busy(false);
    }
  }

}
