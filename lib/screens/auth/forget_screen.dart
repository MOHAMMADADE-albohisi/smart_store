// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/utils/helpers.dart';

class forgetPassword_screen extends StatefulWidget {
  const forgetPassword_screen({Key? key}) : super(key: key);

  @override
  State<forgetPassword_screen> createState() => _forgetPassword_screenState();
}

class _forgetPassword_screenState extends State<forgetPassword_screen> with Helpers{
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
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [

                const SizedBox(height: 150),
                Text(
                  'Forget Password?',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(height: 17),
                Text(
                  'Type your mobile number, and we\'ll send you a verification code via SMS',
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(height: 48),
                TextField(
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
                    hintText: 'Enter your mobile number',
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
                    'Submit',
                    style: GoogleFonts.outfit(
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
      _controolervalue();
      return true;
    }
    ShowSnakBar(context, messageerroe: 'Enter Required data ', error: true);

    return false;
  }

  void _controolervalue() {
    setState(() {
      _mobilError = _mobile.text.isEmpty ? 'Enter your mobile number' : null;
    });
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
              'Verify phone number',
              style: GoogleFonts.cairo(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),

          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'A code consisting of 4 will be sent to the phone number, please do not share it with anyone. To confirm, press',
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
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/verification_forget_screen');
                  }, child: Text('Send',style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,

                  ),)),
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
