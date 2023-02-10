

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_coding/src/app/ui/ships/main_ships_page.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.blue,
              fontFamily: 'Poppins',
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: child);
      },
      child: const MainShips(),
    );
  }
}
