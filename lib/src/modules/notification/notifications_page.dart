import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/notification/notification_controller.dart';
import 'package:ttk/src/widgets/custom/app_app_bar.dart';
import 'package:ttk/src/widgets/tiny/image_view.dart';

class NotificationsPage extends StatelessWidget {
  static const routeName = '/notifications';

  NotificationsPage({Key? key}) : super(key: key);

  final NotificationController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: Text('Notifications')),
      body: Obx(() {
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.xxxLarge,
              vertical: AppPaddings.small,
            ),
            itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(AppPaddings.medium),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [AppShadows.shadow],
                      borderRadius: BorderRadius.circular(AppRadii.medium)),
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.all(AppPaddings.small),
                      decoration: BoxDecoration(
                          color: AppColors.hint.withOpacity(0.2),
                          shape: BoxShape.circle),
                      child: const AppSvgAsset(
                        'assets/images/ic_notification.svg',
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(
                      width: AppSpacings.small,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _controller.notifications[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: AppFontSizes.medium,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: AppSpacings.xxSmall,
                          ),
                          Text(
                            _controller.notifications[index].date,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: AppFontSizes.xxxSmall,
                              color: AppColors.hint,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: AppSpacings.small,
                ),
            itemCount: _controller.notifications.length);
      }),
    );
  }
}
