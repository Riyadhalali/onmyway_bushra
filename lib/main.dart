import 'package:alatareekeh/ui/home.dart';
import 'package:alatareekeh/ui/languageselect.dart';
import 'package:alatareekeh/ui/myappointments.dart';
import 'package:alatareekeh/ui/navigationbar.dart';
import 'package:alatareekeh/ui/privacypolicy.dart';
import 'package:alatareekeh/ui/seekedServices.dart';
import 'package:alatareekeh/ui/signin.dart';
import 'package:alatareekeh/ui/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/resources/strings', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            // var lang = context.locale.toString(); // get lang of app
            // print('your app language is:$lang');
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
              builder: EasyLoading.init(), // init the easy loading
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              initialRoute:
                  SplashScreen.id, // the default screen that will start
              theme: ThemeData.light(),
              routes: {
                //-> we must add all routes
                SplashScreen.id: (context) => SplashScreen(),
                LanguageSelect.id: (context) => LanguageSelect(),
                PrivacyPolicy.id: (context) =>
                    PrivacyPolicy(), // privacy policy route screen
                HomePage.id: (context) => HomePage(),
                SignIn.id: (context) => SignIn(),

                Navigation.id: (context) => Navigation(),

                MyAppointment.id: (context) => MyAppointment(),

                SeekedServices.id: (context) => SeekedServices(),
              },
            );
          },
        );
      },
    );
  }
}
