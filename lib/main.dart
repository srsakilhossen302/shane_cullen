import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/AppRoute/app_route.dart';
import 'Core/Dependency/dependency.dart';
import 'Language/translator.dart';
import 'Utils/AppConst/app_const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: AppConst.appName,
          debugShowCheckedModeBanner: false,
          
          // Bindings
          initialBinding: DependencyInjection(),
          
          // Routing
          initialRoute: AppRoute.login,
          getPages: AppRoute.routes,
          
          // Localization / Translations
          translations: AppTranslator(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          
          // Theme Configuration
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
