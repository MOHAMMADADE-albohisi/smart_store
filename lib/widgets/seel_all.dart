import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class see_all extends StatelessWidget {
  const see_all({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);


  final String title;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See all',
            style: GoogleFonts.nunito(),
          ),
        )
      ],
    );
  }
}