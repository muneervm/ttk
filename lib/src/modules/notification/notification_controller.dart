import 'package:get/get.dart';
import 'package:ttk/src/models/app_notification.dart';

class NotificationController extends GetxController{
  final notifications = <AppNotification>[].obs;
  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  void getNotifications() {
    notifications(AppNotification.dummyList);
  }
}