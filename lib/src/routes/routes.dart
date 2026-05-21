import 'package:get/get.dart';
import 'package:ttk/src/modules/home/home_controller.dart';
import 'package:ttk/src/modules/landing/landing_controller.dart';
import 'package:ttk/src/modules/landing/landing_page.dart';
import 'package:ttk/src/modules/login/auth_controller.dart';
import 'package:ttk/src/modules/login/login_controller.dart';
import 'package:ttk/src/modules/login/login_page.dart';
import 'package:ttk/src/modules/order/hospital_detail_enter_page.dart';
import 'package:ttk/src/modules/order/controller/order_controller.dart';
import 'package:ttk/src/modules/order/patient_detail_enter_page.dart';
import 'package:ttk/src/modules/order/summary_page.dart';
import 'package:ttk/src/modules/order/valve_manufacturer_enter_page.dart';
import 'package:ttk/src/modules/order/valve_other_detail_enter_page.dart';
import 'package:ttk/src/modules/order/valve_ttk_detail_enter_page.dart';
import 'package:ttk/src/modules/order/valve_type_enter_page.dart';
import 'package:ttk/src/modules/register/register_controller.dart';
import 'package:ttk/src/modules/register/register_page.dart';
import 'package:ttk/src/modules/splash/splash_controller.dart';
import 'package:ttk/src/modules/splash/splash_page.dart';

class Routes {
  static var getPages = [
    GetPage(
        name: SplashPage.routeName,
        page: () => SplashPage(),
        binding: BindingsBuilder(() => {
              Get.lazyPut(() => SplashController()),
              Get.lazyPut(() => AuthController()),
            })),
    GetPage(
        name: LoginPage.routeName,
        page: () => LoginPage(),
        binding: BindingsBuilder(() => {
              Get.lazyPut(() => LoginController()),
              Get.lazyPut(() => AuthController()),
            })),
    GetPage(
        name: RegisterPage.routeName,
        page: () => RegisterPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => RegisterController()),
        })),
    GetPage(
        name: LandingPage.routeName,
        page: () => LandingPage(),
        binding: BindingsBuilder(() => {
              Get.lazyPut(() => LandingController()),
              Get.lazyPut(() => HomeController()),
            })),
    GetPage(
        name: HospitalDetailEnterPage.routeName,
        page: () => HospitalDetailEnterPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => OrderController()),
        })),
    GetPage(
        name: PatientDetailEnterPage.routeName,
        page: () => PatientDetailEnterPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => OrderController()),
        })),
    GetPage(
        name: ValveTypeEnterPage.routeName,
        page: () => ValveTypeEnterPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => OrderController()),
        })),
    GetPage(
        name: ValveManufacturerEnterPage.routeName,
        page: () => ValveManufacturerEnterPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => OrderController()),
        })),
    GetPage(
        name: ValveOtherDetailEnterPage.routeName,
        page: () => ValveOtherDetailEnterPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => OrderController()),
        })),
    GetPage(
        name: ValveTtkDetailEnterPage.routeName,
        page: () => ValveTtkDetailEnterPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => OrderController()),
        })),
    GetPage(
        name: SummaryPage.routeName,
        page: () => SummaryPage(),
        binding: BindingsBuilder(() => {
          Get.lazyPut(() => OrderController()),
        })),
  ];
}
