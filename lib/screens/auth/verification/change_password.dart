// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/utils/helpers.dart';

class change_password extends StatefulWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  State<change_password> createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> with Helpers {
  late TextEditingController oldepassword;
  late TextEditingController newPassowrd;
  late TextEditingController newPassowrdvalidate;

  String? _oldepassword;
  String? _newPassowrd;
  String? _newPassowrdvalidate;

  @override
  void initState() {
    super.initState();
    oldepassword = TextEditingController();
    newPassowrd = TextEditingController();
    newPassowrdvalidate = TextEditingController();
  }

  @override
  void dispose() {
    oldepassword.dispose();
    newPassowrd.dispose();
    newPassowrdvalidate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Change password',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const SizedBox(height: 200),
            TextField(
              keyboardType: TextInputType.text,
              controller: oldepassword,
              style: GoogleFonts.outfit(
                color: const Color(0xFFFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                constraints: BoxConstraints(
                  minHeight: 50,
                  maxHeight: _oldepassword == null ? 56 : 81,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                hintText: 'Old Passowrd',
                hintStyle: GoogleFonts.nunito(color: const Color(0xFFFFFFFF)),
                hintMaxLines: 1,
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Color(0xFFFFFFFF),
                ),
                errorText: _oldepassword,
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
            const SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.text,
              controller: newPassowrd,
              style: GoogleFonts.outfit(
                color: const Color(0xFFFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                constraints: BoxConstraints(
                  minHeight: 50,
                  maxHeight: _newPassowrd == null ? 56 : 81,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                hintText: 'New Password',
                hintStyle: GoogleFonts.nunito(color: const Color(0xFFFFFFFF)),
                hintMaxLines: 1,
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Color(0xFFFFFFFF),
                ),
                errorText: _newPassowrd,
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
            const SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.text,
              controller: newPassowrdvalidate,
              style: GoogleFonts.outfit(
                color: const Color(0xFFFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                constraints: BoxConstraints(
                  minHeight: 50,
                  maxHeight: _newPassowrdvalidate == null ? 56 : 81,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                hintText: 'New Password confirmation',
                hintStyle: GoogleFonts.nunito(color: const Color(0xFFFFFFFF)),
                hintMaxLines: 1,
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Color(0xFFFFFFFF),
                ),
                errorText: _newPassowrdvalidate,
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
            const SizedBox(height: 20),
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
                'Update Password',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void performaLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (newPassowrd.text.isNotEmpty &&
        newPassowrdvalidate.text.isNotEmpty &&
        oldepassword.text.isNotEmpty) {
      _controolervalue();
      return true;
    }
    ShowSnakBar(context, messageerroe: 'Enter Required data ', error: true);

    return false;
  }

  void _controolervalue() {
    setState(() {
      _newPassowrd =
          newPassowrd.text.isEmpty ? 'Enter your new password' : null;
      _newPassowrdvalidate = newPassowrdvalidate.text.isEmpty
          ? 'Enter your new password confirmation '
          : null;
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
              child: Column(
                children: [
                  Image.asset('images/image_11.png'),
                ],
              )),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'A new password has been set successfully',
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
                        Navigator.pushNamed(context, '/bottoma_screen');
                      },
                      child: Text(
                        'Done',
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
