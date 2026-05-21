

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/modules/order/hospital_detail_enter_page.dart';
import 'package:ttk/src/modules/order/patient_detail_enter_page.dart';
import 'package:ttk/src/modules/order/valve_manufacturer_enter_page.dart';
import 'package:ttk/src/modules/order/valve_other_detail_enter_page.dart';
import 'package:ttk/src/modules/order/valve_ttk_detail_enter_page.dart';
import 'package:ttk/src/modules/order/valve_type_enter_page.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class SummaryPage extends StatelessWidget {
  static const routeName = '/summary';

  SummaryPage({Key? key}) : super(key: key);

  final OrderController _controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBlue,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSizes.appBarHeight),
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Summary",
                            style: AppTextStyles.appBarTitle),
                        Text("Please verify entered details",
                            style: AppTextStyles.appSubTitle
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ],
                ))),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: Obx((){
            _controller.busy.value;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              children: [
                const SizedBox(
                  height: AppSpacings.medium,
                ),
                _buildHospitalDetails(),
                SizedBox(height: AppSpacings.small,),
                _buildPatientDetails(),
                SizedBox(height: AppSpacings.small,),
                _buildValveType(),
                SizedBox(height: AppSpacings.small,),
                _buildFirstValveDetails(),
                if(_controller.selectedValveType.value=="dual")
                  SizedBox(height: AppSpacings.small,),
                if(_controller.selectedValveType.value=="dual")
                  _buildValveTwoManufacturer(),

                if(_controller.selectedValveType.value=="dual"&&_controller.selectedValveManufacturer.value=="ttk")
                  SizedBox(height: AppSpacings.small,),
                if(_controller.selectedValveType.value=="dual"&&_controller.selectedValveManufacturer.value=="ttk")
                  _buildSecondValveDetails(),

                if(_controller.selectedValveType.value=="dual"&&_controller.selectedValveManufacturer.value=="other")
                  SizedBox(height: AppSpacings.small,),
                if(_controller.selectedValveType.value=="dual"&&_controller.selectedValveManufacturer.value=="other")
                _buildOtherValveDetail(),
                const SizedBox(
                  height: AppSpacings.xxxLarge,
                ),
                Obx((){
                  return AppButton(
                    busy: _controller.busy.value,
                    onPressed: _controller.submitOrder,
                    text: 'Submit',
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }


  Widget _buildHospitalDetails(){
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hospital Details",style: AppTextStyles.appTitle.copyWith(fontSize: 16)),
              GestureDetector(onTap: (){
                _controller.isEdit(true);
                Get.toNamed(HospitalDetailEnterPage.routeName);
              }, child: const Text("Edit",style: TextStyle(fontSize: 14,color: AppColors.appBlue),))
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hospital",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedHospital.value.hospital),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Surgeon",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedSurgeon.value.name),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Surgery Date",style: AppTextStyles.appHintText,),
                  Text(_controller.surgeryDate.value),
                ],
              ),
            ],
          )
        ],),
      ),
    );
  }

  Widget _buildPatientDetails(){
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Patient Details",style: AppTextStyles.appTitle.copyWith(fontSize: 16)),
              GestureDetector(onTap: (){
                _controller.isEdit(true);
                Get.toNamed(PatientDetailEnterPage.routeName);
              }, child: const Text("Edit",style: TextStyle(fontSize: 14,color: AppColors.appBlue),))
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",style: AppTextStyles.appHintText,),
                  Text(_controller.textControllerPatientName.text),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date of birth",style: AppTextStyles.appHintText,),
                  Text(_controller.patientDob.value),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Age",style: AppTextStyles.appHintText,),
                  Text(_controller.textControllerPatientAge.text),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address",style: AppTextStyles.appHintText,),
                  Text(_controller.textControllerPatientAddress.text),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Number",style: AppTextStyles.appHintText,),
                  Text(_controller.textControllerPatientPhone.text),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Alternate Number",style: AppTextStyles.appHintText,),
                  Text(_controller.textControllerPatientAltPhone.text),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          if(_controller.patientImage.value.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Image",style: AppTextStyles.appHintText,),
                  Image.file(File(_controller.patientImage.value),height: 150),
                ],
              ),
            ],
          ),
        ],),
      ),
    );
  }

  Widget _buildValveType(){
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Valve Replacement Type",style: AppTextStyles.appTitle.copyWith(fontSize: 16)),
              GestureDetector(onTap: (){
                Get.toNamed(ValveTypeEnterPage.routeName);
              }, child: const Text("Edit",style: TextStyle(fontSize: 14,color: AppColors.appBlue),))
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveType.value=="single" ? "Single Valve Replacement": "Dual Valve Replacement"),
                ],
              ),
            ],
          )
        ],),
      ),
    );
  }

  Widget _buildFirstValveDetails(){
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_controller.selectedValveType.value=="single" ? "Valve Details" : "First Valve Details",style: AppTextStyles.appTitle.copyWith(fontSize: 16)),
              GestureDetector(onTap: (){
                _controller.currentValveNumber(1);
                if(_controller.selectedValveOne.value!=null){
                  _controller.fillForm(_controller.selectedValveOne.value!);
                }
                Get.toNamed(ValveTtkDetailEnterPage.routeName);
              }, child: const Text("Edit",style: TextStyle(fontSize: 14,color: AppColors.appBlue),))
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Serial No",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveOne.value?.serialNo??""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Batch No",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveOne.value?.batchNo ?? ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date of Mfg.",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveOne.value?.mfgDate ?? ""),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date of Exp.",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveOne.value?.expDate ?? ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Implant Position",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveOne.value?.position.position ?? ""),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Valve Type",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveOne.value?.valveType ?? ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          if(_controller.selectedValveOne.value?.image!=null&&_controller.selectedValveOne.value!.image.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Image",style: AppTextStyles.appHintText,),
                  Image.file(File(_controller.selectedValveOne.value!.image),height: 150),
                ],
              ),
            ],
          ),
        ],),
      ),
    );
  }

  Widget _buildValveTwoManufacturer(){
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Valve Two Manufacturer",style: AppTextStyles.appTitle.copyWith(fontSize: 16)),
              GestureDetector(onTap: (){
                Get.toNamed(ValveManufacturerEnterPage.routeName);
              }, child: const Text("Edit",style: TextStyle(fontSize: 14,color: AppColors.appBlue),))
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Manufacturer",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveManufacturer.value),
                ],
              ),
            ],
          )
        ],),
      ),
    );
  }

  Widget _buildSecondValveDetails(){
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Second Valve Details",style: AppTextStyles.appTitle.copyWith(fontSize: 16)),
              GestureDetector(onTap: (){
                _controller.currentValveNumber(2);
                if(_controller.selectedValveTwo.value!=null){
                  _controller.fillForm(_controller.selectedValveTwo.value!);
                }
                Get.toNamed(ValveTtkDetailEnterPage.routeName);
              }, child: const Text("Edit",style: TextStyle(fontSize: 14,color: AppColors.appBlue),))
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Serial No",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveTwo.value?.serialNo??""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Batch No",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveTwo.value?.batchNo ?? ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date of Mfg.",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveTwo.value?.mfgDate ?? ""),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date of Exp.",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveTwo.value?.expDate ?? ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Implant Position",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveTwo.value?.position.position ?? ""),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Valve Type",style: AppTextStyles.appHintText,),
                  Text(_controller.selectedValveTwo.value?.valveType ?? ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppSpacings.small,
          ),
          if(_controller.selectedValveTwo.value?.image!=null&&_controller.selectedValveTwo.value!.image.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Image",style: AppTextStyles.appHintText,),
                    Image.file(File(_controller.selectedValveTwo.value!.image),height: 150),
                  ],
                ),
              ],
            ),
        ],),
      ),
    );
  }

  Widget _buildOtherValveDetail(){
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Second Valve Details",style: AppTextStyles.appTitle.copyWith(fontSize: 16)),
              GestureDetector(onTap: (){
                Get.toNamed(ValveOtherDetailEnterPage.routeName);
              }, child: const Text("Edit",style: TextStyle(fontSize: 14,color: AppColors.appBlue),))
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Details",style: AppTextStyles.appHintText,),
                  Text(_controller.textControllerValveDetail.text),
                ],
              ),
            ],
          )
        ],),
      ),
    );
  }
}
