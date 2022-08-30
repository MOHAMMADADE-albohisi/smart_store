// ignore: duplicate_ignore
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/utils/helpers.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> with Helpers {
  late TextEditingController _mobile;
  late TextEditingController _password;
  bool _viewpassword = true;

  String? _mobilereore;
  String? _passworderror;

  @override
  void initState() {
    super.initState();
    _mobile = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _mobile.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  const SizedBox(height: 250),
                  Text(
                    'SMART LOGIN',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.white,
                    ),
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
                        maxHeight: _mobilereore == null ? 50 : 75,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      hintText: 'Mobile',
                      labelStyle: GoogleFonts.nunito(),
                      prefixIcon: const Icon(Icons.phone_android),
                      errorText: _mobilereore,
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
                        maxHeight: _passworderror == null ? 50 : 75,
                        minHeight: 50,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      errorText: _passworderror,
                      errorStyle: GoogleFonts.nunito(),
                      errorMaxLines: 1,
                    ),
                    maxLines: 1,
                    minLines: 1,
                    expands: false,
                  ),
                  const SizedBox(height: 40),
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
                      'Login',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forget_screen');
                    },
                    child: Text(
                      'FORGOT DETAILS?',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register_screen');
                    },
                    child: Text(
                      'CREATE ACCOUNT',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                  ),
                ],
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
    if (_mobile.text.isNotEmpty && _password.text.isNotEmpty) {
      _controolervalue();
      return true;
    }

    ShowSnakBar(context, messageerroe: 'Enter Required data ', error: true);
    return false;
  }

  void _controolervalue() {
    setState(() {
      _mobilereore = _mobile.text.isEmpty ? 'Enter Email address' : null;
      _passworderror = _password.text.isEmpty ? 'Enter password' : null;
    });
  }

  void login() {
    Navigator.pushNamed(context, '/bottomed_screen');
  }
}
