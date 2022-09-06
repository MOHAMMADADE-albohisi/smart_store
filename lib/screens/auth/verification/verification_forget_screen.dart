// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class verification_forget_screen extends StatefulWidget {
  verification_forget_screen({Key? key})
      : super(key: key);

  @override
  State<verification_forget_screen> createState() =>
      _verification_forget_screenState();
}

class _verification_forget_screenState extends State<verification_forget_screen>
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
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.forgetpassword,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  AppLocalizations.of(context)!.verificationamaseegforget,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppTextField(
                  hint: AppLocalizations.of(context)!.hinttext,
                  prefixIcon: (Icons.phone_android_rounded),
                  keyboardType: TextInputType.number,
                  controller: _mobile,
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => performaLogin(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(
                    327,
                    56,
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.resetpasswrd,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
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
        messageerroe: AppLocalizations.of(context)!.error_data, error: true);

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
              AppLocalizations.of(context)!.verificatinsuccfordet,
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
                        Navigator.pushNamed(context, '/resetPassword_screen');
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
