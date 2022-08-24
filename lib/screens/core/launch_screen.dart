import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class lunch_screen extends StatefulWidget {
  const lunch_screen({Key? key}) : super(key: key);
  @override
  State<lunch_screen> createState() => _lunch_screenState();
}
class _lunch_screenState extends State<lunch_screen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onbressd_screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.bottomStart,
            end: AlignmentDirectional.topEnd,
            colors: [
              Color(0xFFA6D1E6),
              Color(0xFFFEFBF6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/image_1.png'),
            SizedBox(height: 20),
            Text('SMART STORE',style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black54,
            ),)
          ],
        ),
      ),
    );
  }
}
