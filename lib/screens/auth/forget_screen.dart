// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class forgetPassword_screen extends StatefulWidget {
  const forgetPassword_screen({Key? key}) : super(key: key);

  @override
  State<forgetPassword_screen> createState() => _forgetPassword_screenState();
}

class _forgetPassword_screenState extends State<forgetPassword_screen>
    with Helpers {
  late TextEditingController _mobile;

  @override
  void initState() {
    super.initState();
    _mobile = TextEditingController();
  }

  @override
  void dispose() {
    _mobile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 150),
                Text(
                  AppLocalizations.of(context)!.forgot,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 17),
                Text(
                  AppLocalizations.of(context)!.messgemobile,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 48),
                AppTextField(
                  hint: AppLocalizations.of(context)!.inputmobile,
                  prefixIcon: (Icons.phone_android_rounded),
                  keyboardType: TextInputType.number,
                  controller: _mobile,
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () => performaLogin(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    minimumSize: const Size(
                      327,
                      56,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.send,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
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
    if (_mobile.text.isNotEmpty) {
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
            child: Text(
              AppLocalizations.of(context)!.verifyphonenumber,
              style: GoogleFonts.cairo(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              AppLocalizations.of(context)!.massegforget,
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
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/verification_forget_screen');
                      },
                      child: Text(
                        AppLocalizations.of(context)!.send,
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
