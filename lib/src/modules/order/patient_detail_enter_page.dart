import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/utils/app_formatter.dart';
import 'package:ttk/src/widgets/custom/image_picker.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';
import 'package:ttk/src/models/image_response.dart' as s;

class PatientDetailEnterPage extends StatelessWidget {
  static const routeName = '/patient_detail';

  PatientDetailEnterPage({Key? key}) : super(key: key);

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
                        const Text("Patient Details",
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
              const SizedBox(
                height: AppSpacings.medium,
              ),
               AppInputText(
                controller: _controller.textControllerPatientName,
                hintText: "Name of patient",
                shadow: true,
                border: true,
                required: true,
                radius: 50,
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
                        initialValue: _controller.patientDob.value,
                        style: AppTextStyles.inputText,
                        decoration: InputDecoration(
                          hintText: "Date of birth",
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
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Date',
                        onChanged: (val) {
                          _controller.patientDob(val);
                          _controller.textControllerPatientAge.text  = AppFormatter.calculateAge(DateTime.parse(val)).toString();
                        },
                        validator: (val) {
                          return null;
                        },
                        onSaved: (val) => _controller.patientDob(val),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacings.small,),
                  Expanded(
                    child: AppInputText(
                      controller: _controller.textControllerPatientAge,
                      hintText: "Age",
                      shadow: true,
                      border: true,
                      radius: 50,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSpacings.small,
              ),
              AppInputText(
                controller: _controller.textControllerPatientAddress,
                minLines: 3,
                hintText: "Address",
                shadow: true,
                border: true,
                required: true,
              ),
              const SizedBox(
                height: AppSpacings.small,
              ),
              AppInputText(
                keyboardType: TextInputType.phone,
                controller: _controller.textControllerPatientPhone,
                hintText: "Mobile Number",
                shadow: true,
                border: true,
                required: true,
                radius: 50,
              ),
              const SizedBox(
                height: AppSpacings.small,
              ),
              AppInputText(
                keyboardType: TextInputType.phone,
                controller: _controller.textControllerPatientAltPhone,
                hintText: "Alternate Number",
                shadow: true,
                border: true,
                required: true,
                radius: 50,
              ),
              const SizedBox(
                height: AppSpacings.small,
              ),
              ImagePickerWidget(
                  onSelect: (image){
                _controller.patientImage(image.first.image);
              },
              enableGallery: true,
              selectedFile: _controller.patientImage.value.isNotEmpty ? [s.Image(id: _controller.patientImage.value,image: _controller.patientImage.value)] : []),
              const SizedBox(
                height: AppSpacings.xxxLarge,
              ),
              AppButton(
                busy: _controller.busy.value,
                onPressed: _controller.storePatientAndGotoNextPage,
                text: _controller.isEdit.isTrue ? "OK":'Next',
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
