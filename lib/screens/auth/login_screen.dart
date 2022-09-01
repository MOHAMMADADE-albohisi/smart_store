// ignore: duplicate_ignore
// ignore_for_file: camel_case_types
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> with Helpers {
  late TextEditingController _mobile;
  late TextEditingController _password;
  late bool showpasssword = false;
  late TapGestureRecognizer _click;

  @override
  void initState() {
    super.initState();
    _click = TapGestureRecognizer();
    _click.onTap = createnewacountclick;
    _mobile = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _click.dispose();
    _mobile.dispose();
    _password.dispose();

    super.dispose();
  }

  void createnewacountclick() {
    Navigator.pushNamed(context, '/register_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              width: 375.w,
              height: 250.h,
              decoration: BoxDecoration(
                color: const Color(0xFF96E5D1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.r),
                  bottomLeft: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 116.h),
                    Text(
                      AppLocalizations.of(context)!.welcome,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.h,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.welcomein,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.h,
                        color: const Color(0xFFFFFFFF),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 62.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.h),
              child: Column(
                children: [
                  AppTextField(
                    hint: AppLocalizations.of(context)!.number,
                    obscureText: false,
                    prefixIcon: Icons.phone_android_rounded,
                    keyboardType: TextInputType.number,
                    controller: _mobile,
                  ),
                  SizedBox(height: 20.h),
                  AppTextField(
                    hint: AppLocalizations.of(context)!.password,
                    obscureText: true,
                    prefixIcon: Icons.lock,
                    keyboardType: TextInputType.text,
                    controller: _password,
                    sufficIcon: IconButton(
                      onPressed: () {
                        setState(() => {showpasssword = !showpasssword});
                      },
                      icon: Icon(showpasssword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 73.h),
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
                  AppLocalizations.of(context)!.login,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 53.h),
            Text(
              AppLocalizations.of(context)!.underlogin,
              style: GoogleFonts.nunitoSans(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF8D9AC9),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Image.asset('images/image_7.png'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Image.asset('images/image_8.png'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Image.asset('images/image_9.png'),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forget_screen');
              },
              child: Text(
                AppLocalizations.of(context)!.forgot,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: const Color(0xFF8D9AC9),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Center(
              child: RichText(
                text: TextSpan(
                    text: AppLocalizations.of(context)!.reglogin,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 13.h,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF8D9AC9),
                    ),
                    children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.reglogin2,
                          recognizer: _click,
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.h,
                            color: const Color(0xFF2FA9FF),
                          ))
                    ]),
              ),
            ),
          ],
        ));
  }

  void performaLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_mobile.text.isNotEmpty && _password.text.isNotEmpty) {
      return true;
    }

    ShowSnakBar(context, messageerroe:  AppLocalizations.of(context)!.snacks, error: true);
    return false;
  }

  void login() {
    Navigator.pushNamed(context, '/bottomed_screen');
  }
}
