import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/resources/hospital_repository.dart';
import 'package:ttk/src/widgets/custom/app_dialog.dart';

class AddNewHospitalController extends GetxController{
  final busy = false.obs;
  late final textControllerName = TextEditingController();
  late final textControllerAddress = TextEditingController();
  late final textControllerEmail = TextEditingController();
  late final textControllerPhone = TextEditingController();
  final _hospitalRepository = HospitalRepository();

  void saveHospital()async{
    if(_validate()){
      busy(true);
      try{
        final response = await _hospitalRepository.saveHospital(textControllerName.text,
        address: textControllerAddress.text,email: textControllerEmail.text,contact: textControllerPhone.text);
        if(response.status){
          Get.back();
          AppDialog.showSnackBar("Success", "Hospital added successfully.");
          Get.find<OrderController>().getHospitals();
        }else{
          AppDialog.showSnackBar("Failed", response.message ?? "Something went wrong! Try again.");
        }
      }catch(_){
        AppDialog.showSnackBar("Invalid name", "Please enter a valid name");
      }finally{
        busy(false);
      }
    }
  }

  bool _validate(){
    if(textControllerName.text.isEmpty){
      AppDialog.showSnackBar('Invalid Name', 'Please enter a valid name');
      return false;
    }else if(textControllerAddress.text.isEmpty){
      AppDialog.showSnackBar('Invalid Address', 'Please enter a valid address');
      return false;
    }/*else if(textControllerEmail.text.isEmpty || !textControllerEmail.text.isEmail){
      AppDialog.showSnackBar('Invalid Email', 'Please enter a valid email');
      return false;
    }*/else if(textControllerPhone.text.isEmpty || !textControllerPhone.text.isPhoneNumber){
      AppDialog.showSnackBar('Invalid Phone number', 'Please enter a valid phone number');
      return false;
    }else{
      return true;
    }
  }
}