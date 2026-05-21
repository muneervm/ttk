import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/modules/splash/splash_page.dart';
import 'package:ttk/src/routes/routes.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      onGenerateTitle: (BuildContext context) => 'TTK',
      theme: AppThemes.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      getPages: Routes.getPages,
    );
  }
}
