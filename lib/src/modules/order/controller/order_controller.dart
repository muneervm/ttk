import 'dart:io';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ttk/src/models/hospital.dart';
import 'package:ttk/src/models/position.dart';
import 'package:ttk/src/models/surgeon.dart';
import 'package:ttk/src/models/valve.dart';
import 'package:ttk/src/modules/landing/landing_page.dart';
import 'package:ttk/src/modules/login/login_page.dart';
import 'package:ttk/src/modules/order/patient_detail_enter_page.dart';
import 'package:ttk/src/modules/order/summary_page.dart';
import 'package:ttk/src/modules/order/valve_manufacturer_enter_page.dart';
import 'package:ttk/src/modules/order/valve_other_detail_enter_page.dart';
import 'package:ttk/src/modules/order/valve_ttk_detail_enter_page.dart';
import 'package:ttk/src/modules/order/valve_type_enter_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:ttk/src/modules/order/widgets/add_hospital.dart';
import 'package:ttk/src/modules/order/widgets/add_surgeon.dart';
import 'package:ttk/src/resources/hospital_repository.dart';
import 'package:ttk/src/widgets/custom/app_dialog.dart';
import 'dart:convert';

class OrderController extends GetxController {
  final busy = false.obs;

  var qr = ''.obs;
  var selectedValveType = ''.obs;
  var selectedValveManufacturer = ''.obs;
  var selectedValveImage = ''.obs;
  var selectedValveOne = Rxn<Valve>();
  var selectedValveTwo = Rxn<Valve>();
  var selectedValvePosition = Rxn<Position>();
  final _picker = ImagePicker();

  final hospitals = <Hospital>[].obs;

  final surgeons = <Surgeon>[].obs;
  final valvePositions = <Position>[].obs;

  final selectedHospital = Hospital().obs;
  final selectedSurgeon = Surgeon().obs;
  final surgeryDate = ''.obs;

  late final textControllerPatientName = TextEditingController();
  final patientDob = ''.obs;
  final patientImage = ''.obs;
  late final textControllerPatientAge = TextEditingController();
  late final textControllerPatientAddress = TextEditingController();
  late final textControllerPatientPhone = TextEditingController();
  late final textControllerPatientAltPhone = TextEditingController();


  // ttk valve fields
  late final textControllerValveSerialNo = TextEditingController();
  late final textControllerValveBatchNo = TextEditingController();
  final valveDateOfMfg = ''.obs;
  final valveDateOfExp = ''.obs;
  final selectedTtkValveType = ''.obs;
  final tTtkValveTypes =  <String>[].obs;

  final _hospitalRepository =  HospitalRepository();

  late final textControllerValveDetail = TextEditingController();

  bool get isValveTwo => (selectedValveType.value=="dual" && selectedValveOne.value == null);


  var isEdit = false.obs;
  var currentValveNumber = 1.obs;

  @override
  void onInit() {
    super.onInit();
    tTtkValveTypes(["Aortic","Mitral"]);
    getHospitals();
    getSurgeons();
    getPositions();
  }

  void getHospitals() async{
   final response = await _hospitalRepository.getHospitals();
   if(response.success){
     hospitals(response.hospitals);
   }
  }

  void getSurgeons() async{
    final response = await _hospitalRepository.getSurgeons();
    if(response.success){
      surgeons(response.surgeons);
    }
  }

  void getPositions() async{
    final response = await _hospitalRepository.getValvePositions();
    if(response.success){
      valvePositions(response.positions);
    }
  }


  void gotoLoginPage() {
    Get.offAllNamed(LoginPage.routeName);
  }

  void storeHospitalsAndGotoNextPage() {
    if(selectedHospital.value.hospital.isEmpty){
      AppDialog.showSnackBar("Invalid Hospital", "Please select a hospital");
    }else if(selectedSurgeon.value.name.isEmpty){
      AppDialog.showSnackBar("Invalid Surgeon", "Please select a surgeon");
    }else if(surgeryDate.isEmpty){
      AppDialog.showSnackBar("Invalid Surgery Date", "Please select a surgery date");
    }else{
      if(isEdit.isTrue){
        isEdit(false);
        Get.back();
      }else{
        Get.toNamed(PatientDetailEnterPage.routeName);
      }
    }
  }

  void storePatientAndGotoNextPage() {
    if(textControllerPatientName.text.isEmpty){
      AppDialog.showSnackBar("Invalid Patient Name", "Please enter a valid name");
    }/*else if(patientDob.isEmpty){
      AppDialog.showSnackBar("Invalid Date of birth", "Please select a date of birth");
    }*//*else if(textControllerPatientAge.text.isEmpty){
      AppDialog.showSnackBar("Invalid Age", "Please enter a valid age");
    }*/else if(textControllerPatientAddress.text.isEmpty){
      AppDialog.showSnackBar("Invalid Address", "Please enter a valid address");
    }else if(textControllerPatientPhone.text.isEmpty) {
      AppDialog.showSnackBar(
          "Invalid Mobile Number", "Please enter a valid mobile number");
    }else if(textControllerPatientAltPhone.text.isEmpty) {
      AppDialog.showSnackBar(
          "Invalid Alternate Number", "Please enter a valid alternate number");
    }/*else if(patientImage.isEmpty) {
      AppDialog.showSnackBar(
          "Invalid Image", "Please upload patient image");
    }*/else{
      busy(true);
      busy(false);
      if(isEdit.isTrue){
        isEdit(false);
        Get.back();
      }else{
        Get.toNamed(ValveTypeEnterPage.routeName);
      }

    }

  }

  void storeValveTypeAndGotoNextPage() {
    if (selectedValveType.value.isEmpty) {
      Get.showSnackbar(const GetSnackBar(title: "Valve type not selected",
        message: "Please select a valve type to continue!",
        duration: Duration(seconds: 3),));
    } else {
     /* if(selectedValveType.value=="dual"){
      Get.toNamed(ValveManufacturerEnterPage.routeName);
      }else{*/
      currentValveNumber(1);
      if(selectedValveOne.value!=null){
        fillForm(selectedValveOne.value!);
      }
        Get.toNamed(ValveTtkDetailEnterPage.routeName);
     // }

    }
  }

  void storeValveManufacturerAndGotoNextPage() {
    if (selectedValveManufacturer.value.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        title: "Valve Manufacturer not selected",
        message: "Please select a valve Manufacturer to continue!",
        duration: Duration(seconds: 3),));
    } else {
      if (selectedValveManufacturer.value == "other") {
        Get.toNamed(ValveOtherDetailEnterPage.routeName);
      }
      else {
        currentValveNumber(2);
        if(selectedValveTwo.value!=null){
          fillForm(selectedValveTwo.value!);
        }
        Get.toNamed(ValveTtkDetailEnterPage.routeName);
      }
    }
  }

  void selectValveType(String valveType) {
    selectedValveType(valveType);
  }

  void selectValveManufacturer(String manufacturer) {
    selectedValveManufacturer(manufacturer);
  }

  void submit() {

    if(selectedValveManufacturer.value =="other"){
      if(textControllerValveDetail.text.isEmpty){
        AppDialog.showSnackBar("Invalid detail", "Please enter valid valve details");
      }else{
        gotoSummary();
      }
    }else{
      if(_validateTtkValve()){
        Valve valve = Valve(position: selectedValvePosition.value!,
            serialNo: qr.value.isNotEmpty ? qr.value.trim().toString() : textControllerValveSerialNo.text,
        batchNo: textControllerValveBatchNo.text,
        mfgDate: valveDateOfMfg.value,
        expDate: valveDateOfExp.value,
        valveType: selectedTtkValveType.value,
        image: selectedValveImage.value);
        if(currentValveNumber.value == 1){ //selectedValveType.value=="single"
          selectedValveOne(valve);
        }else{
          selectedValveTwo(valve);
          /*if(selectedValveOne.value == null){
            selectedValveOne(valve);
          }else{
            selectedValveTwo(valve);
          }*/
        }

        if(selectedValveType.value=="dual" && selectedValveTwo.value==null){
          _clearForm();
          Get.toNamed(ValveManufacturerEnterPage.routeName);
        }else{
          gotoSummary();
        }
      }
    }
  }

  bool _validateTtkValve(){
    if(textControllerValveSerialNo.text.isEmpty){
      AppDialog.showSnackBar("Invalid Serial No", "Please enter valid serial no");
      return false;
    }else if(textControllerValveBatchNo.text.isEmpty){
      AppDialog.showSnackBar("Invalid Batch No", "Please enter valid batch no");
      return false;
    }/*else if(valveDateOfMfg.isEmpty){
      AppDialog.showSnackBar("Invalid Manufacturing date", "Please enter valid manufacturing date");
      return false;
    }else if(valveDateOfExp.isEmpty){
      AppDialog.showSnackBar("Invalid Expiry date", "Please enter valid expiry date");
      return false;
    }*//*else if(selectedValveImage.isEmpty){
      AppDialog.showSnackBar("Invalid Image", "Please upload valve image");
      return false;
    }*/else if(selectedValvePosition.value == null){
      AppDialog.showSnackBar("Invalid Position", "Please select a valve position");
      return false;
    }else if(selectedTtkValveType.value.isEmpty){
      AppDialog.showSnackBar("Invalid Valve Type", "Please select a valve type");
      return false;
    }else{
      return true;
    }
  }

  void _clearForm(){
    textControllerValveSerialNo.clear();
    textControllerValveBatchNo.clear();
    valveDateOfMfg('');
    valveDateOfExp('');
    selectedValveImage('');
    selectedTtkValveType('');
    qr('');
    selectedValvePosition(null);
  }

  void fillForm(Valve valve){
    textControllerValveSerialNo.text = valve.serialNo;
    textControllerValveBatchNo.text = valve.batchNo;
    valveDateOfMfg(valve.mfgDate);
    valveDateOfExp(valve.expDate);
    selectedValveImage(valve.image);
    selectedTtkValveType(valve.valveType);
    selectedValvePosition(valve.position);
  }

  void gotoSummary(){
    Get.toNamed(SummaryPage.routeName);
  }

  void submitOrder()async{
    busy(true);
    try{

      Map<String, String> data = {
        "name":textControllerPatientName.text,
        "dob":patientDob.value,
        "age":textControllerPatientAge.text,
        "address":textControllerPatientAddress.text,
        "contact":textControllerPatientPhone.text,
        "number":textControllerPatientAltPhone.text,
        "hospital":selectedHospital.value.hospital,
        "hospital_id":selectedHospital.value.id.toString(),
        "surgeon":selectedSurgeon.value.name,
        "surgeon_id":selectedSurgeon.value.id.toString(),
        "date_of_surgeory":surgeryDate.value,
        "valve_type":selectedValveType.value,
        "details":textControllerValveDetail.text,
        "serial_no1":selectedValveOne.value!.serialNo,
        "batch_number1":selectedValveOne.value!.batchNo,
        "date_mfg1":selectedValveOne.value!.mfgDate,
        "date_exp1":selectedValveOne.value!.expDate,
        "valve_position1":selectedValveOne.value!.position.position,
        "valve_position1_id":selectedValveOne.value!.position.id.toString(),
        "vtype1":selectedValveOne.value!.valveType,
        "type":selectedValveManufacturer.value
      };



      if(selectedValveType.value=="dual" && selectedValveTwo.value!=null){
        var v2 = {
          "serial_no2":selectedValveTwo.value!.serialNo,
          "batch_number2":selectedValveTwo.value!.batchNo,
          "date_mfg2":selectedValveTwo.value!.mfgDate,
          "date_exp2":selectedValveTwo.value!.expDate,
          "valve_position2":selectedValveTwo.value!.position.position,
          "valve_position2_id":selectedValveTwo.value!.position.id.toString(),
          "vtype2":selectedValveTwo.value!.valveType,
        };

        data.addAll(v2);
      }
      print(data);
      final response = await _hospitalRepository.saveOrder(data,file: patientImage.value,file1:selectedValveOne.value?.image, file2: selectedValveTwo.value?.image);
      if(response.status){
        Get.showSnackbar(const GetSnackBar(title: "Success",
          message: "Submitted successfully",
          duration: Duration(seconds: 3),));
        Get.offAllNamed(LandingPage.routeName);
      }else{
        AppDialog.showSnackBar("Failed", response.message ?? "Something went wrong! try again.");
      }

    }catch(_){
      print(_.toString());
      AppDialog.showSnackBar("Failed", "Something went wrong! try again.");
    }
    finally{
      busy(false);
    }
  }

  void pickFromCamera() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 60);

    if (image == null) return;

    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    var fileName = basename(image.path);
    File file = File(image.path);
    final File localImage = await file.copy('$path/$fileName');
    selectedValveImage(localImage.path);
  }

  void pickFromGallery() async {
    FilePickerResult? result = await FilePicker.pickFiles(
        allowMultiple: true, type: FileType.image);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;

      for (File file in files) {
        var fileName = basename(file.path);
        File newFile = File(file.path);
        final File localImage = await newFile.copy(
            '$path/${DateTime.now().millisecondsSinceEpoch.toString()}_$fileName');
        selectedValveImage(localImage.path);
      }
    }
  }

  void scanBarCode() async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.type == ResultType.Barcode) {
        String barcodeScanRes = result.rawContent.toString();
        print('ttkres');
        print(barcodeScanRes);
        qr(barcodeScanRes);

        textControllerValveSerialNo.text = qr.value.trim().toString().substring(
            qr.value.trim().toString().indexOf("T1"),
            qr.value.trim().toString().length);
      }
    } on PlatformException {
      print('Failed to get platform version.');
    }
  }


  void showAddNewSurgeonSheet(){
    Get.bottomSheet(AddSurgeonSheet());
  }

  void showAddNewHospitalSheet(){
    Get.bottomSheet(AddHospitalSheet());
  }

  void clearValveDetailsOnPop(){
    print(selectedValveTwo.value?.serialNo);
    if(selectedValveTwo.value !=null){
      print('cleared two');
      selectedValveTwo = Rxn<Valve>();
    }else{
      print('cleared one');
      selectedValveOne = Rxn<Valve>();
    }
  }
}
