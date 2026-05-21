import 'package:flutter/material.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/models/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  const OrderTile({Key? key,required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order.name,style: AppTextStyles.appSubTitle,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     Text(order.valveType == "single" ? "Single Valve ": "Dual Valve ",style: AppTextStyles.appContent.copyWith(fontSize: AppFontSizes.xSmall),),
                     Text(order.type,style: AppTextStyles.appContent.copyWith(fontSize: AppFontSizes.xSmall),),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text("Hospital",style: AppTextStyles.appHintText,),
                      const SizedBox(height: AppSpacings.xxSmall,),
                      Text(order.hospital,style: AppTextStyles.appText,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text("Surgeon",style: AppTextStyles.appHintText,),
                      const SizedBox(height: AppSpacings.xxSmall,),
                      Text(order.surgeon,style: AppTextStyles.appText,),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}