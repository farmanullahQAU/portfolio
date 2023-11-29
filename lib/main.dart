import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:port/pages/home/home_view.dart';
import 'package:port/theme.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'pages/home/home_binding.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 800, name: MOBILE),
          const Breakpoint(start: 801, end: 1200, name: TABLET),
          const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      title: 'Farman Ullah',
      theme: AppTheme().lightTheme,
      themeMode: ThemeMode.dark,
      initialBinding: HomeBinding(),
      darkTheme: AppTheme().darkTheme,
      home: const HomePage(),
    );
  }
}
