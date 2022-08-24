import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/buttons.dart';

class homelogin_screen extends StatefulWidget {
  const homelogin_screen({Key? key}) : super(key: key);

  @override
  State<homelogin_screen> createState() => _homelogin_screenState();
}

class _homelogin_screenState extends State<homelogin_screen> {
  late TapGestureRecognizer _click;

  @override
  void initState() {
    super.initState();
    _click = TapGestureRecognizer();
    _click.onTap = createnewacountclick;
  }

  @override
  void dispose() {
    _click.dispose();
    super.dispose();
  }

  void createnewacountclick() {
    print('test mohamamd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/image_5.png',
              width: double.infinity,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 360),
                Text(
                  'SMART STORE',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(height: 50),
                buttons(
                    name: 'Login with Apple',
                    image: 'image_7',
                    color: (0xFF121217),
                    onPressed: () {}),
                SizedBox(height: 15),
                buttons(
                    name: 'Login with Facebook',
                    image: 'image_8',
                    color: (0xFF4048EF),
                    onPressed: () {}),
                SizedBox(height: 15),
                buttons(
                    name: 'Login with Twitter',
                    image: 'image_9',
                    color: (0xFF5FC9E9),
                    onPressed: () {}),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 130),
                  child: Row(
                    children: [
                      Container(
                        width: 47.53,
                        height: 1,
                        color: Color(0xFFFFFFFF),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'OR',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 47.53,
                        height: 1,
                        color: Color(0xFFFFFFFF),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 327,
                  height: 58,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 15),
                          Text(
                            'Sign Up',
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
                ),
                SizedBox(height: 25),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?  ',
                      style: GoogleFonts.nunito(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In !',
                          recognizer: _click,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
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
}
