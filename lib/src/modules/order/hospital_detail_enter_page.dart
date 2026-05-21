import 'package:flutter_awesome_select_clone/flutter_awesome_select.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/models/hospital.dart';
import 'package:ttk/src/models/surgeon.dart';
import 'package:ttk/src/modules/home/home_app_bar.dart';
import 'package:ttk/src/modules/home/home_page.dart';
import 'package:ttk/src/modules/landing/landing_controller.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_dropdown_button.dart';

class HospitalDetailEnterPage extends StatelessWidget {
  static const routeName = '/hospital_detail';

  HospitalDetailEnterPage({Key? key}) : super(key: key);

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
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hospital Details",
                            style: AppTextStyles.appBarTitle),
                        Text("Please fill all required details",
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
              SizedBox(
                height: AppSpacings.medium,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Obx((){
                      return SmartSelect<Hospital>.single(
                          title: 'Hospital',
                          modalFilter: true,
                          modalType: S2ModalType.bottomSheet,
                          modalFilterAuto: true,
                          selectedValue: _controller.hospitals.isNotEmpty ? (_controller.selectedHospital.value.hospital.isEmpty ? Hospital() :  _controller.selectedHospital.value) : Hospital(),
                          choiceItems: S2Choice.listFrom<Hospital,Hospital>(
                            source: _controller.hospitals.value,
                            value: (index, item) => item,
                            title: (index, item) => item.hospital,
                          ),
                          selectedChoice: _controller.hospitals.isNotEmpty ? (_controller.selectedHospital.value.hospital.isEmpty ? null : S2Choice(value: _controller.selectedHospital.value, title: _controller.selectedHospital.value.hospital)) : null,
                          onChange: (state) {
                            _controller.selectedHospital(state.value);
                          },
                        modalHeaderStyle: const S2ModalHeaderStyle(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                          )
                        ),
                        tileBuilder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${state.title}',
                                    style: const TextStyle(
                                      fontSize: AppFontSizes.xxSmall,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text("*",style: TextStyle(color: AppColors.red),)
                                ],
                              ),
                              const SizedBox(
                                height: AppSpacings.xSmall,
                              ),
                              GestureDetector(
                                onTap: _controller.hospitals.isNotEmpty? state.showModal : null,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPaddings.large, vertical: 12),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(AppRadii.large),
                                      border: Border.all(
                                        color: AppColors.hint,
                                      ),
                                      boxShadow: [AppShadows.shadow]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(_controller.selectedHospital.value.hospital.isNotEmpty ?_controller.selectedHospital.value.hospital : "Please select"),
                                      ),
                                      Transform.rotate(
                                        angle: -(90 * 3.14 / 180),
                                        child: const Icon(
                                          Icons.arrow_back_ios_sharp,
                                          color: AppColors.hint,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                      /*return AppDropDownButton(
                        title: 'Hospital',
                        shadow: true,
                        onChanged: _controller.selectedHospital,
                        value: _controller.hospitals.isNotEmpty ? (_controller.selectedHospital.value.hospital.isEmpty ? null : _controller.selectedHospital.value) : null,
                        items: _controller.hospitals
                            .map<DropdownMenuItem<Hospital>>((e) =>
                            DropdownMenuItem<Hospital>(
                                value: e, child: Text(e.hospital)))
                            .toList(),
                        selectedItemBuilder: (context) => _controller.hospitals
                            .map((e) => Align(
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                                fit: BoxFit.scaleDown, child: Text(e.hospital))))
                            .toList(),
                      );*/
                    }),
                  ),
                  const SizedBox(
                    width: AppSpacings.small,
                  ),
                  MaterialButton(
                    color: AppColors.appBlue,
                    textColor: AppColors.white,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadii.large)),
                    onPressed: _controller.showAddNewHospitalSheet,
                    child: Row(
                      children: const [Text("Add Hospital"), Icon(Icons.add)],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: AppSpacings.medium,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Obx((){
                      return SmartSelect<Surgeon>.single(
                        title: 'Surgeon',
                        modalFilter: true,
                        modalType: S2ModalType.bottomSheet,
                        modalFilterAuto: true,
                        selectedValue: _controller.surgeons.isNotEmpty ? (_controller.selectedSurgeon.value.name.isEmpty ? Surgeon() :  _controller.selectedSurgeon.value) : Surgeon(),
                        choiceItems: S2Choice.listFrom<Surgeon,Surgeon>(
                          source: _controller.surgeons.value,
                          value: (index, item) => item,
                          title: (index, item) => item.name,
                        ),
                        selectedChoice: _controller.surgeons.isNotEmpty ? (_controller.selectedSurgeon.value.name.isEmpty ? null : S2Choice(value: _controller.selectedSurgeon.value, title: _controller.selectedSurgeon.value.name)) : null,
                        onChange: (state) {
                          _controller.selectedSurgeon(state.value);
                        },
                        modalHeaderStyle: const S2ModalHeaderStyle(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                            )
                        ),
                        tileBuilder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${state.title}',
                                    style: const TextStyle(
                                      fontSize: AppFontSizes.xxSmall,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text("*",style: TextStyle(color: AppColors.red),)
                                ],
                              ),
                              const SizedBox(
                                height: AppSpacings.xSmall,
                              ),
                              GestureDetector(
                                onTap: _controller.surgeons.length>0? state.showModal : null,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPaddings.large, vertical: 12),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(AppRadii.large),
                                      border: Border.all(
                                        color: AppColors.hint,
                                      ),
                                      boxShadow: [AppShadows.shadow]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(_controller.selectedSurgeon.value.name.isNotEmpty ?_controller.selectedSurgeon.value.name : "Please select"),
                                      ),
                                      Transform.rotate(
                                        angle: -(90 * 3.14 / 180),
                                        child: const Icon(
                                          Icons.arrow_back_ios_sharp,
                                          color: AppColors.hint,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                      /*return AppDropDownButton(
                        title: 'Surgeon',
                        shadow: true,
                        onChanged: _controller.selectedSurgeon,
                        value: _controller.surgeons.isNotEmpty ? (_controller.selectedSurgeon.value.name.isEmpty ? null : _controller.selectedSurgeon.value) : null,
                        items: _controller.surgeons
                            .map<DropdownMenuItem<Surgeon>>((e) =>
                            DropdownMenuItem<Surgeon>(
                                value: e, child: Text(e.name)))
                            .toList(),
                        selectedItemBuilder: (context) => _controller.surgeons
                            .map((e) => Align(
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                                fit: BoxFit.scaleDown, child: Text(e.name))))
                            .toList(),
                      );*/
                    }),
                  ),
                  const SizedBox(
                    width: AppSpacings.small,
                  ),
                  MaterialButton(
                    color: AppColors.appBlue,
                    textColor: AppColors.white,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadii.large)),
                    onPressed: _controller.showAddNewSurgeonSheet,
                    child: Row(
                      children: [Text("Add Surgeon "), Icon(Icons.add)],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: AppSpacings.medium,
              ),
              Row(
                children: [
                  Text(
                    'Date of Surgery',
                    style: const TextStyle(
                      fontSize: AppFontSizes.xxSmall,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("*",style: TextStyle(color: AppColors.red),)
                ],
              ),
              const SizedBox(
                height: AppSpacings.xSmall,
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [AppShadows.shadow]),
                child: DateTimePicker(
                  initialValue: _controller.patientDob.value,
                  style: AppTextStyles.inputText,
                  decoration: InputDecoration(
                    hintText: "Select date",
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.hint, width: 1),
                      borderRadius: BorderRadius.circular(AppRadii.large),
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.hint, width: 1),
                      borderRadius: BorderRadius.circular(AppRadii.large),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.hint, width: 1),
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
                  onChanged: (val) => _controller.surgeryDate(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => _controller.surgeryDate(val),
                ),
              ),
              const SizedBox(
                height: AppSpacings.xxxLarge,
              ),
              AppButton(
                busy: _controller.busy.value,
                onPressed: _controller.storeHospitalsAndGotoNextPage,
                text: _controller.isEdit.isTrue ? "OK" : 'Next',
              ),
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
