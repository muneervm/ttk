import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/resources/hospital_repository.dart';
import 'package:ttk/src/widgets/custom/app_dialog.dart';

class AddNewSurgeonController extends GetxController{
  final busy = false.obs;
  late final textControllerName = TextEditingController();
  final _hospitalRepository = HospitalRepository();

  void saveSurgeon()async{
    if(textControllerName.text.isNotEmpty){
      busy(true);
      try{
        final response = await _hospitalRepository.saveSurgeon(textControllerName.text);
        if(response.status){
          Get.back();
          AppDialog.showSnackBar("Success", "Surgeon added successfully.");
          Get.find<OrderController>().getSurgeons();

        }else{
          AppDialog.showSnackBar("Failed", response.message ?? "Something went wrong! Try again.");
        }
      }catch(_){
        AppDialog.showSnackBar("Invalid name", "Please enter a valid name");
      }finally{
        busy(false);
      }
    }else{
      AppDialog.showSnackBar("Invalid name", "Please enter a valid name");
    }
  }
}