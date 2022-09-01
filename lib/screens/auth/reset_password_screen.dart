// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class resetPassword_screen extends StatefulWidget {
  const resetPassword_screen({Key? key}) : super(key: key);

  @override
  State<resetPassword_screen> createState() => _resetPassword_screenState();
}

class _resetPassword_screenState extends State<resetPassword_screen>
    with Helpers {
  late TextEditingController newPassowrd;
  late TextEditingController newPassowrdvalidate;

  @override
  void initState() {
    super.initState();
    newPassowrd = TextEditingController();
    newPassowrdvalidate = TextEditingController();
  }

  @override
  void dispose() {
    newPassowrd.dispose();
    newPassowrdvalidate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: 375.w,
            height: 100.h,
            decoration: const BoxDecoration(
              color: Color(0xFF96E5D1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(width: 60.w),
                Text(
                  AppLocalizations.of(context)!.resetpasswrd,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 17.h,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            AppLocalizations.of(context)!.titelresetpasswrd,
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xFF43538D),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  AppLocalizations.of(context)!.newpassword,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10.h),
                AppTextField(
                  hint: AppLocalizations.of(context)!.resetpasswrd,
                  prefixIcon: (Icons.lock),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: newPassowrd,
                ),
                SizedBox(height: 20.h),
                Text(
                  AppLocalizations.of(context)!.newpasswordconf,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10.h),
                AppTextField(
                  hint: AppLocalizations.of(context)!.newpasswordconf,
                  prefixIcon: (Icons.lock),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: newPassowrdvalidate,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: ElevatedButton(
              onPressed: () => performaLogin(),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF96E5D1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(
                  double.infinity,
                  50,
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.changepassword,
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void performaLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (newPassowrd.text.isNotEmpty && newPassowrdvalidate.text.isNotEmpty) {
      return true;
    }
    ShowSnakBar(context,
        messageerroe: AppLocalizations.of(context)!.snacks, error: true);

    return false;
  }

  void login() {
    _confirmeLogoute();
  }

  void _confirmeLogoute() async {
    bool? test = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  Image.asset('images/image_11.png'),
                ],
              )),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              AppLocalizations.of(context)!.newpasswordsuccessfully,
              style: GoogleFonts.cairo(
                fontSize: 13,
                color: Colors.black45,
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login_screen');
                      },
                      child: Text(
                        AppLocalizations.of(context)!.done,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      )),
                ),
              ],
            )
          ],
        );
      },
    );
    if (test ?? false) {
      //
    }
  }
}
