// ignore_for_file: camel_case_types

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/utils/helpers.dart';

class register_screen extends StatefulWidget {
  const register_screen({Key? key}) : super(key: key);

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> with Helpers {
  late TextEditingController _name;
  late TextEditingController _mobile;
  late TextEditingController _password;
  late TextEditingController _city;
  late TapGestureRecognizer _click;

  bool _viewpassword = true;

  String? _nameError;
  String? _mobilError;
  String? _passwordError;
  String? _cityError;
  String? _gender;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _mobile = TextEditingController();
    _password = TextEditingController();
    _city = TextEditingController();
    _click = TapGestureRecognizer();
    _click.onTap = createnewacountclick;
  }

  @override
  void dispose() {
    _name.dispose();
    _mobile.dispose();
    _password.dispose();
    _city.dispose();
    _click.dispose();
    super.dispose();
  }

  void createnewacountclick() {
    Navigator.pushNamed(context, '/login_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        excludeHeaderSemantics: true,
        title: Text(
          'SMART Register',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.white,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  TextField(
                    controller: _name,
                    style: GoogleFonts.nunito(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      constraints: BoxConstraints(
                        minHeight: 50,
                        maxHeight: _nameError == null ? 50 : 75,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      hintText: 'Name',
                      labelStyle: GoogleFonts.nunito(),
                      prefixIcon: const Icon(Icons.person_outlined),
                      errorText: _mobilError,
                      errorStyle: GoogleFonts.nunito(),
                      errorMaxLines: 1,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                    ),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _mobile,
                    style: GoogleFonts.nunito(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      constraints: BoxConstraints(
                        minHeight: 50,
                        maxHeight: _mobilError == null ? 50 : 75,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      hintText: 'Mobile',
                      labelStyle: GoogleFonts.nunito(),
                      prefixIcon: const Icon(Icons.phone_android),
                      errorText: _mobilError,
                      errorStyle: GoogleFonts.nunito(),
                      errorMaxLines: 1,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                    ),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _password,
                    obscureText: _viewpassword,
                    style: GoogleFonts.nunito(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() => {_viewpassword = !_viewpassword});
                        },
                        icon: Icon(_viewpassword
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                        maxHeight: _passwordError == null ? 50 : 75,
                        minHeight: 50,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      errorText: _passwordError,
                      errorStyle: GoogleFonts.nunito(),
                      errorMaxLines: 1,
                    ),
                    maxLines: 1,
                    minLines: 1,
                    expands: false,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _city,
                    style: GoogleFonts.nunito(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      constraints: BoxConstraints(
                        minHeight: 50,
                        maxHeight: _cityError == null ? 50 : 75,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      hintText: 'City',
                      labelStyle: GoogleFonts.nunito(),
                      prefixIcon: const Icon(Icons.maps_home_work_rounded),
                      errorText: _cityError,
                      errorStyle: GoogleFonts.nunito(),
                      errorMaxLines: 1,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                    ),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Gender',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text(
                            'Male',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                            ),
                          ),
                          value: 'M',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() => _gender = value);
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text(
                            'Female',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                            ),
                          ),
                          value: 'F',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() => _gender = value);
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () => performaLogin(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      children: [
                        Container(
                          width: 47.53,
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'OR',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 47.53,
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 327,
                    height: 58,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade400,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/image_8.png',
                            width: 10,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'Login with Facebook',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Do you already have an account?  ',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'sign in!',
                        recognizer: _click,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
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
    if (_name.text.isNotEmpty &&
        _mobile.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _city.text.isNotEmpty) {
      _controolervalue();
      return true;
    }
    ShowSnakBar(context, messageerroe: 'Enter Required data ', error: true);
    return false;
  }

  void _controolervalue() {
    setState(() {
      _nameError = _password.text.isEmpty ? 'Enter name' : null;
      _mobilError = _mobile.text.isEmpty ? 'Enter Email address' : null;
      _passwordError = _password.text.isEmpty ? 'Enter password' : null;
      _cityError = _password.text.isEmpty ? 'Enter city' : null;
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
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'A text message containing 4 characters has been sent to your number',
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
                        Navigator.pushNamed(context, '/registration_verification_screen');
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
