import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/home/home_controller.dart';
import 'package:ttk/src/modules/landing/landing_controller.dart';
import 'package:ttk/src/widgets/custom/order_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = Get.find();

  final LandingController _landingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        _controller.getOrders();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          //borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
          children: [
            const Text(
              "All Sales",
              style: AppTextStyles.appTitle,
            ),
            const SizedBox(
              height: 15,
            ),
            Obx((){
              if(_controller.busy.value){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  child: Center(child: SizedBox(height: 50,width: 50,child: const CircularProgressIndicator())),
                );
              }
              if(_controller.message.isNotEmpty){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  child: Center(child: Text(_controller.message.value)),
                );
              }

              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 8,),
                shrinkWrap: true,
                itemCount: _controller.orders.length,
                itemBuilder: (context, index) => OrderTile(order: _controller.orders[index]),
              );
            }),
            /*,*/
            const SizedBox(
              height: AppSpacings.xxxLarge + 20,
            ),
          ],
        ),
      ),
    );
  }
}
