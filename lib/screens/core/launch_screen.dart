// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class lunch_screen extends StatefulWidget {
  const lunch_screen({Key? key}) : super(key: key);

  @override
  State<lunch_screen> createState() => _lunch_screenState();
}

class _lunch_screenState extends State<lunch_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed( Duration(seconds: 3), () {
      bool loggedIn = SharedPrefController().getValueFor<bool>(key: PrefKeys.loggedIn.name)?? false;
      String route = loggedIn ? '/bottomed_screen' : '/login_screen' ;
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.bottomStart,
            end: AlignmentDirectional.topEnd,
            colors: [
              Color(0xFFA6D1E6),
              Color(0xFFFEFBF6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/image_1.png'),
            SizedBox(height: 20.h),
            Text(
              AppLocalizations.of(context)!.smart_store,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 20.h,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
