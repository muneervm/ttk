import 'package:flutter/material.dart';

class AppFonts {
  static const primaryFontFamily = 'MavenPro';
}

class AppFontSizes {
  static const xxxSmall = 10.0;
  static const xxSmall = 12.0;
  static const xSmall = 13.0;
  static const small = 14.0;
  static const medium = 15.0;
  static const large = 18.0;
  static const xLarge = 20.0;
  static const xxLarge = xLarge; //24.0;
  static const xxxLarge = 36.0;

  static const appHeader = xxLarge;
  static const appTitle = large;
  static const appSubTitle = small;
  static const appContent = xSmall;
  static const appFooter = xxSmall;
  static const authTitle = xxxLarge;
  static const planTitle = large;
  static const planPrice = small;
  static const appButton = large;
  static const inputText = large;
}

class AppTextStyles {
  static const appHintText = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: FontWeight.w400,
    color: AppColors.authInputHintText,
    overflow: TextOverflow.clip,
  );

  static const appText = TextStyle(
    fontSize: AppFontSizes.medium,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    overflow: TextOverflow.clip,
  );
  static const appHeader = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.appHeader,
    color: AppColors.appBarTitle,
  );
  static const appTitle = TextStyle(
    fontSize: AppFontSizes.appTitle,
    fontWeight: FontWeight.w600,
  );
  static const appSubTitle = TextStyle(
    fontSize: AppFontSizes.appSubTitle,
  );
  static const appContent = TextStyle(
    fontSize: AppFontSizes.appContent,
  );
  static const appFooter = TextStyle(
    fontSize: AppFontSizes.appFooter,
  );
  static const inputHintText = TextStyle(
    fontSize: AppFontSizes.appSubTitle,
    color: AppColors.authInputHintText,
    overflow: TextOverflow.clip,
  );
  static const alertDialogTitle = TextStyle(
    fontSize: AppFontSizes.appTitle,
    fontWeight: FontWeight.w600,
    color: AppColors.dialogTitle,
  );
  static const alertDialogContent = TextStyle(
    fontSize: AppFontSizes.appContent,
    color: AppColors.dialogContent,
  );
  static const appBarTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.primaryFontFamily,
    fontSize: AppFontSizes.appHeader,
    color: AppColors.appBarTitle,
  );
  static const appButton = TextStyle(
    fontSize: AppFontSizes.appTitle,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static const inputText = TextStyle(
    fontSize: AppFontSizes.appContent,
    //fontWeight: FontWeight.w600,
    color: AppColors.authInputText,
  );
  static const messageTitle = TextStyle(
    fontSize: AppFontSizes.appTitle,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
  static const textButton = TextStyle(
    fontSize: AppFontSizes.appTitle,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );
}

class AppThemes {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    fontFamily: AppFonts.primaryFontFamily,
    textTheme: textDefault,
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primaryAppSwatch,
    splashColor: AppColors.primary.withOpacity(0.4),
    appBarTheme: AppThemes.appBar,
  );
  static const appBar = AppBarTheme(
    backgroundColor: AppColors.appBarBackgroundColor,
    elevation: AppElevations.appBar,
    iconTheme: appBarIcon,
    titleTextStyle: AppTextStyles.appBarTitle,
  );
  static const appBarIcon = IconThemeData(
    color: AppColors.appBarTitle,
  );

  static var textDefault = const TextTheme(
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(),
    displayLarge: TextStyle(),
  ).apply(
    bodyColor: AppColors.text,
    displayColor: AppColors.text,
  );
}

class AppButtonStyles {
  static final appButton = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent, backgroundColor: AppColors.primary,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.medium)),
  );
  static final appButtonDisabled = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent, backgroundColor: AppColors.hint,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.medium)),
  );
  static final appRoundButton = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent, backgroundColor: AppColors.primary,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: const StadiumBorder(),
  );
  static final appRoundButtonDisabled = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent, backgroundColor: AppColors.hint,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: const StadiumBorder(),
  );
  static final alertDialogPositive = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent, backgroundColor: AppColors.secondary,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.medium),
    ),
  );
  static final alertDialogNegative = TextButton.styleFrom(
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.dialogNegativeButton),
      borderRadius: BorderRadius.circular(AppRadii.medium),
    ),
  );
  static final textButton =
      TextButton.styleFrom(textStyle: AppTextStyles.textButton);

  static final textButtonListMore = TextButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: AppFontSizes.small,
        color: AppColors.primary,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: const Size(0, 0),
      padding: EdgeInsets.zero);
  static final couponButton = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent, backgroundColor: AppColors.secondary,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.symmetric(vertical: AppPaddings.zero),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.zero)),
  );
  static final couponButtonDisabled = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent, backgroundColor: AppColors.hint,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.symmetric(vertical: AppPaddings.zero),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.zero)),
  );
}

class AppColors {
  static const primary = Color(0xFF053384);
  static const primaryLight = Color(0xFF94053384);
  static const primaryAccent = Color(0xFF053384);
  static const secondary = primary;
  static const secondaryLight = primaryLight;
  static const greenAccent = Color(0xFF6FCF97);
  static const green = Color(0xFF27AE60);
  static const red = Color(0xFFEB5757);
  static const text = Color(0xFF353535);
  static const primaryAppSwatch = MaterialColor(0xFF053384, color);
  static const scaffoldBackgroundColor = Color(0xFFFAFAFA);
  static const white = Colors.white;
  static const black = Colors.black;
  static const hint = Color(0xFFA4A3B8);
  static const blackShade = Colors.black45;

  /* static const color = {
    50: Color.fromRGBO(255, 126, 0, .1),
    100: Color.fromRGBO(255, 126, 0, .2),
    200: Color.fromRGBO(255, 126, 0, .3),
    300: Color.fromRGBO(255, 126, 0, .4),
    400: Color.fromRGBO(255, 126, 0, .5),
    500: Color.fromRGBO(255, 126, 0, .6),
    600: Color.fromRGBO(255, 126, 0, .7),
    700: Color.fromRGBO(255, 126, 0, .8),
    800: Color.fromRGBO(255, 126, 0, .9),
    900: Color.fromRGBO(255, 126, 0, 1),
  };*/
  static const color = {
    50: Color.fromRGBO(5, 51, 132, .1),
    100: Color.fromRGBO(5, 51, 132, .2),
    200: Color.fromRGBO(5, 51, 132, .3),
    300: Color.fromRGBO(5, 51, 132, .4),
    400: Color.fromRGBO(5, 51, 132, .5),
    500: Color.fromRGBO(5, 51, 132, .6),
    600: Color.fromRGBO(5, 51, 132, .7),
    700: Color.fromRGBO(5, 51, 132, .8),
    800: Color.fromRGBO(5, 51, 132, .9),
    900: Color.fromRGBO(5, 51, 132, 1),
  };

  static const Color shimmerBaseColor = Color(0xffF0F1F4);
  static const Color shimmerHighlightColor = Color(0xffDBDFE9);
  static const appBarBackgroundColor = backgroundWhite;
  static const appBarTitle = white;
  static const backgroundWhite = white;
  static const appBlue = Color(0xff053384);
  static const splashBackground = appBlue;
  static const shadow = black;
  static const authInputText = text;
  static const authInputHintText = hint;
  static const authCursor = secondary;
  static const authButton = secondary;
  static const loginBackground = white;
  static const authButtonText = white;
  static const dialogNegativeButton = blackShade;
  static const dialogTitle = text;
  static const dialogContent = blackShade;
  static const snackBarBackground = text;
  static const snackBarText = white;
  static const otpInputBackground = white;
  static const numPadBackground = white;
  static const numPadBackgroundBusy = scaffoldBackgroundColor;
}

class AppSpacings {
  static const zero = 0.0;
  static const xxSmall = 4.0;
  static const xSmall = 8.0;
  static const small = 12.0;
  static const medium = 24.0;
  static const xxLarge = 30.0;
  static const xxxLarge = 54.0;
}

class AppPaddings {
  static const zero = 0.0;
  static const xxxSmall = 3.0;
  static const xxSmall = 5.0;
  static const xSmall = 8.0;
  static const small = 12.0;
  static const medium = 15.0;
  static const large = 20.0;
  static const xLarge = 24.0;
  static const xxLarge = 30.0;
  static const xxxLarge = xxLarge;

  static const appBarDefault = xLarge;
  static const inputTextVertical = medium;
  static const inputTextHorizontal = large;
  static const authContent = large;
  static const onBoardingContent = xxxLarge;
  static const alertDialog = large;
  static const otpContent = 40.0;
  static const otpInputPadding = xxLarge;
}

class AppElevations {
  static const zero = 0.0;

  static const appButton = zero;
  static const appBar = zero;
}

class AppSizes {
  static const appButton = 230.0;
  static const appButtonHeight = 54.0;
  static const dialogButtonHeight = 42.0;
  static const winnerTrophyHeight = 40.0;
  static const shopCardHeight = 230.0;
  static const appBarHeight = 80.0;
  static const homeAppBarHeight = 150.0;
  static const appBackButton = 46.0;
  static const profileImageHome = 50.0;
  static const profileImageProfile = 140.0;
  static const profileImageProfileUpdate = 150.0;
  static const logoHeight = 100.0;
  static const logoWidth = 230.0;
  static const alertDialog = 320.0;
  static const bottomNavigationIconSize = 24.0;
  static const upcomingEventCardHomeWidth = 250.0;
  static const upcomingEventCardHomeHeight = 150.0;
  static const crownSize = 56.0;
  static const segmentControllerHeight = 50.0;
  static const segmentControllerWidth = 160.0;
}

class AppRadii {
  static double zero = 0.0;
  static const medium = 20.0;
  static const large = 30.0;
}

class AppBorders {
  /* static final inputText = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadii.inputText),
    borderSide: const BorderSide(
      color: AppColors.inputTextBorder,
      width: 2.0,
    ),
  );
  static final inputTextDark = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadii.inputText),
    borderSide: const BorderSide(
      color: AppColors.inputTextBorderDark,
      width: 2.0,
    ),
  );*/
}

class AppShadows {
  static final shadow = BoxShadow(
    color: AppColors.shadow.withOpacity(0.15),
    blurRadius: 18,
    offset: const Offset(0, 4),
  );
}
