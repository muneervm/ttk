import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/models/position.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_dropdown_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class ValveTtkDetailEnterPage extends StatelessWidget {
  static const routeName = '/valve_ttk';

  ValveTtkDetailEnterPage({Key? key}) : super(key: key);

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
                         // _controller.clearValveDetailsOnPop();
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
                        const Text("TTK Valve Details",
                            style: AppTextStyles.appBarTitle),
                        Text("Please enter valve details",
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
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            children: [
              const SizedBox(
                height: AppSpacings.medium,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 6),
                decoration:
                BoxDecoration(boxShadow: [AppShadows.shadow],color: const Color(0xff01CBFF),
                    borderRadius: BorderRadius.circular(AppRadii.large),
                    border: _controller.selectedValveType.value =="single" ? Border.all(color: Colors.transparent) : null),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                  'Serial No.',
                  style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                        Text("*",style: TextStyle(color: AppColors.red),)
                      ],
                    ),
                    const SizedBox(width: 2,),
                    Expanded(
                      child: TextFormField(
                        controller: _controller.textControllerValveSerialNo,
                        style: TextStyle(color: Colors.white,fontSize: 16),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 5)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: AppSpacings.medium,
              ),
              AppInputText(
                controller: _controller.textControllerValveBatchNo,
                shadow: true,
                border: true,
                  required: true,
                hintText: "Batch Number",
              ),
              const SizedBox(
                height: AppSpacings.small,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [AppShadows.shadow]),
                      child: DateTimePicker(
                        initialValue: _controller.valveDateOfMfg.value,
                        style: AppTextStyles.inputText,
                        decoration: InputDecoration(
                          hintText: "Date of Mfg",
                          suffixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: AppColors.hint, width: 1),
                            borderRadius: BorderRadius.circular(AppRadii.large),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: AppColors.hint, width: 1),
                            borderRadius: BorderRadius.circular(AppRadii.large),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: AppColors.hint, width: 1),
                            borderRadius: BorderRadius.circular(AppRadii.large),
                          ),
                          fillColor: AppColors.white,
                          focusColor: AppColors.white,
                          hintStyle: AppTextStyles.inputHintText,
                          prefixStyle: AppTextStyles.inputText,
                          hintMaxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppPaddings.xLarge,
                            vertical: AppPaddings.inputTextVertical,
                          ),
                        ),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Date',
                        onChanged: (val) {
                          _controller.valveDateOfMfg(val);
                          _controller.valveDateOfExp('');
                        },
                        validator: (val) {
                          return null;
                        },
                        onSaved: (val) => _controller.valveDateOfMfg(val),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacings.small,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [AppShadows.shadow]),
                      child: Obx((){
                        print(_controller.valveDateOfMfg.value);
                        return DateTimePicker(
                          initialValue: _controller.valveDateOfExp.value,
                          initialDate: _controller.valveDateOfMfg.isNotEmpty ? DateTime.parse(_controller.valveDateOfMfg.value).add(const Duration(days:  365 * 5)) : DateTime.now(),
                          style: AppTextStyles.inputText,
                          decoration: InputDecoration(
                            hintText: "Date of Exp",
                            suffixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: AppColors.hint, width: 1),
                              borderRadius: BorderRadius.circular(AppRadii.large),
                            ),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: AppColors.hint, width: 1),
                              borderRadius: BorderRadius.circular(AppRadii.large),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: AppColors.hint, width: 1),
                              borderRadius: BorderRadius.circular(AppRadii.large),
                            ),
                            fillColor: AppColors.white,
                            focusColor: AppColors.white,
                            hintStyle: AppTextStyles.inputHintText,
                            prefixStyle: AppTextStyles.inputText,
                            hintMaxLines: 1,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppPaddings.xLarge,
                              vertical: AppPaddings.inputTextVertical,
                            ),
                          ),
                          firstDate: _controller.valveDateOfMfg.isNotEmpty ? DateTime.parse(_controller.valveDateOfMfg.value).add(const Duration(days:  365 * 5)) : DateTime.now(),
                          lastDate: DateTime(2100),
                          dateLabelText: 'Date',
                          onChanged: (val) => _controller.valveDateOfExp(val),
                          validator: (val) {
                            return null;
                          },
                          onSaved: (val) => _controller.valveDateOfExp(val),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSpacings.small,
              ),
              Obx((){
                return AppDropDownButton(
                  title: 'Implant  Position',
                  shadow: true,
                  required: true,
                  onChanged: (Position val) => _controller.selectedValvePosition(val),
                  value: _controller.valvePositions.isNotEmpty ? (_controller.selectedValvePosition.value) : null,
                  items: _controller.valvePositions
                      .map<DropdownMenuItem<Position>>((e) =>
                      DropdownMenuItem<Position>(
                          value: e, child: Text(e.position)))
                      .toList(),
                  selectedItemBuilder: (context) => _controller.valvePositions
                      .map((e) => Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.scaleDown, child: Text(e.position))))
                      .toList(),
                );
              }),
              const SizedBox(
                height: AppSpacings.small,
              ),
              Obx((){
                return AppDropDownButton(
                  title: 'Valve type',
                  shadow: true,
                  required: true,
                  onChanged: (val) => _controller.selectedTtkValveType(val.toString()),
                  value: _controller.selectedTtkValveType.value.isEmpty ? null : _controller.selectedTtkValveType.value,
                  items: _controller.tTtkValveTypes
                      .map<DropdownMenuItem<String>>((e) =>
                      DropdownMenuItem<String>(
                          value: e, child: Text(e)))
                      .toList(),
                  selectedItemBuilder: (context) => _controller.tTtkValveTypes
                      .map((e) => Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.scaleDown, child: Text(e))))
                      .toList(),
                );
              }),
              const SizedBox(
                height: AppSpacings.medium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: IconButton(onPressed: _controller.pickFromCamera, icon: Image.asset("assets/images/capture.png",color: AppColors.appBlue,))),
                  const SizedBox(
                    width: AppSpacings.small,
                  ),
                 // Text(_controller.qr.value),
                  Image.asset("assets/images/or.png",color: AppColors.appBlue,width: 18),
                  const SizedBox(
                    width: AppSpacings.small,
                  ),
                  Expanded(child: IconButton(onPressed: _controller.scanBarCode, icon: Image.asset("assets/images/scan.png",color: AppColors.appBlue,))),
                  const SizedBox(
                    width: AppSpacings.small,
                  ),
                  Image.asset("assets/images/or.png",color: AppColors.appBlue,width: 18),
                  const SizedBox(
                    width: AppSpacings.small,
                  ),
                  Expanded(child: IconButton(onPressed: _controller.pickFromGallery, icon: Image.asset("assets/images/upload.png",color: AppColors.appBlue,))),
                ],
              ),
              const SizedBox(
                height: AppSpacings.small,
              ),
              Obx((){
                if(_controller.selectedValveImage.value.isNotEmpty){
                 return Container(
                      height: 90,
                      padding: const EdgeInsets.only(right: 10),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.file(
                              File(_controller.selectedValveImage.value),
                              fit: BoxFit.contain,
                              height: 80,
                            ),
                          ),
                          Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  _controller.selectedValveImage('');
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 18,
                                    )),
                              ))
                        ],
                      ));
                }
                return const SizedBox();
              }),
              const SizedBox(
                height: AppSpacings.xxxLarge,
              ),
              Obx((){
                return AppButton(
                  busy: _controller.busy.value,
                  onPressed: _controller.submit,
                  text: _controller.currentValveNumber.value==1 ? "Continue" : 'Submit',
                );
              }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
