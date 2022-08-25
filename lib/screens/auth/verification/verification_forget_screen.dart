// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class verification_forget_screen extends StatefulWidget {
  const verification_forget_screen({Key? key}) : super(key: key);

  @override
  State<verification_forget_screen> createState() =>
      _verification_forget_screenState();
}

class _verification_forget_screenState
    extends State<verification_forget_screen> {
  late TextEditingController _mobile;
  String? _mobilError;

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
          'Verification Number',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/image_10.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Please enter the 4-digit verification code to be able to reset a new password',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _mobile,
                  style: GoogleFonts.outfit(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  Colors.grey,
                    constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: _mobilError == null ? 56 : 81,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    hintText: 'Enter your 4 digit number',
                    hintStyle:
                    GoogleFonts.nunito(color: const Color(0xFFFFFFFF)),
                    hintMaxLines: 1,
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Color(0xFFFFFFFF),
                    ),
                    errorText: _mobilError,
                    errorStyle: GoogleFonts.outfit(),
                    errorMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                  ),
                  minLines: null,
                  maxLines: null,
                  expands: true,
                ),
              ),
              const SizedBox(height: 25),
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
                  'Submit',
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
      _controolervalue();
      return true;
    }
    _controolervalue();

    return false;
  }

  void _controolervalue() {
    setState(() {
      _mobilError = _mobile.text.isEmpty ? 'Enter your mobile number' : null;
    });
  }

  void login() {
  Navigator.popAndPushNamed(context, '/resetPassword_screen');
  }
}
