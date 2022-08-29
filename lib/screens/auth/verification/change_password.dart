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
  bool _viewpassword1 = true;
  bool _viewpassword2 = true;
  bool _viewpassword3 = true;

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
      appBar: AppBar(title: const Text('Change password')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                TextField(
                  controller: oldepassword,
                  obscureText: _viewpassword1,
                  style: GoogleFonts.nunito(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => {_viewpassword1 = !_viewpassword1});
                      },
                      icon: Icon(
                          _viewpassword1 ? Icons.visibility_off : Icons.visibility),
                    ),
                    hintText: 'Password',
                    labelStyle: GoogleFonts.nunito(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: _oldepassword == null ? 50 : 75,
                      minHeight: 50,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    errorText: _oldepassword,
                    errorStyle: GoogleFonts.nunito(),
                    errorMaxLines: 1,
                  ),
                  maxLines: 1,
                  minLines: 1,
                  expands: false,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: newPassowrd,
                  obscureText: _viewpassword2,
                  style: GoogleFonts.nunito(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => {_viewpassword2 = !_viewpassword2});
                      },
                      icon: Icon(
                          _viewpassword2 ? Icons.visibility_off : Icons.visibility),
                    ),
                    hintText: 'Password',
                    labelStyle: GoogleFonts.nunito(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: _newPassowrd == null ? 50 : 75,
                      minHeight: 50,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    errorText: _newPassowrd,
                    errorStyle: GoogleFonts.nunito(),
                    errorMaxLines: 1,
                  ),
                  maxLines: 1,
                  minLines: 1,
                  expands: false,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: newPassowrdvalidate,
                  obscureText: _viewpassword3,
                  style: GoogleFonts.nunito(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => {_viewpassword3 = !_viewpassword3});
                      },
                      icon: Icon(
                          _viewpassword3 ? Icons.visibility_off : Icons.visibility),
                    ),
                    hintText: 'Password',
                    labelStyle: GoogleFonts.nunito(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: _newPassowrdvalidate == null ? 50 : 75,
                      minHeight: 50,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    errorText: _newPassowrdvalidate,
                    errorStyle: GoogleFonts.nunito(),
                    errorMaxLines: 1,
                  ),
                  maxLines: 1,
                  minLines: 1,
                  expands: false,
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
      return true;
    }
    ShowSnakBar(context, messageerroe: 'Enter Required data ', error: true);

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
