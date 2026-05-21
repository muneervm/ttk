import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/order/controller/add_new_surgeon_controller.dart';
import 'package:ttk/src/widgets/tiny/app_button.dart';
import 'package:ttk/src/widgets/tiny/app_input_text.dart';

class AddSurgeonSheet extends StatelessWidget {
  AddSurgeonSheet({Key? key}) : super(key: key);

  final _controller = AddNewSurgeonController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: AppSpacings.medium,
          ),
          const Text("Add New Surgeon",style: AppTextStyles.appTitle,),
          const SizedBox(
            height: AppSpacings.xxLarge,
          ),
          AppInputText(
            controller: _controller.textControllerName,
            hintText: "Name*",
            shadow: true,
            border: true,
          ),
          const SizedBox(
            height: AppSpacings.medium,
          ),
          Obx((){
            return AppButton(
              busy: _controller.busy.value,
              onPressed: _controller.saveSurgeon,
              text: 'Save',
            );
          }),
        ],
      ),
    );
  }
}
