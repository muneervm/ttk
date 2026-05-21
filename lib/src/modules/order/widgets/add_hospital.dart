import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/order/controller/add_new_hospital_controller.dart';
import 'package:ttk/src/modules/order/controller/add_new_surgeon_controller.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class AddHospitalSheet extends StatelessWidget {
  AddHospitalSheet({Key? key}) : super(key: key);

  final _controller = AddNewHospitalController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: AppSpacings.medium,
            ),
            const Text("Add New Hospital",style: AppTextStyles.appTitle,),
            const SizedBox(
              height: AppSpacings.xxLarge,
            ),
            AppInputText(
              controller: _controller.textControllerName,
              hintText: 'Name*',
              keyboardType: TextInputType.text,
              cursorColor: AppColors.authCursor,
              prefixIcon: Icon(Icons.person),
            ),
            const SizedBox(
              height: AppSpacings.small,
            ),
            AppInputText(
              controller: _controller.textControllerEmail,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              cursorColor: AppColors.authCursor,
              prefixIcon: Icon(Icons.email),
            ),
            const SizedBox(
              height: AppSpacings.small,
            ),
            AppInputText(
              controller: _controller.textControllerPhone,
              hintText: 'Phone Number*',
              keyboardType: TextInputType.phone,
              cursorColor: AppColors.authCursor,
              prefixIcon: Icon(Icons.phone_in_talk),
            ),
            const SizedBox(
              height: AppSpacings.small,
            ),
            AppInputText(
              controller: _controller.textControllerAddress,
              minLines: 3,
              hintText: "Hospital Address*",
              shadow: true,
              border: true,
            ),
            const SizedBox(
              height: AppSpacings.small,
            ),
            Obx((){
              return AppButton(
                busy: _controller.busy.value,
                onPressed: _controller.saveHospital,
                text: 'Save',
              );
            }),
          ],
        ),
      ),
    );
  }
}
