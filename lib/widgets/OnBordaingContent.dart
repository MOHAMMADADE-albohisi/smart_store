import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class outbording extends StatelessWidget {
  const outbording({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375.w,
          height: 474.h,
          child: Image.asset(
            'images/$image.png',
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.bold,
            fontSize: 22.h,
            color: Color(0xFF3E3E3E),
          ),
        ),
        SizedBox(height: 24.9.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 53.h),
          child: Text(
            subtitle,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.h,
              fontWeight: FontWeight.w400,
              color: Color(0xFF3E3E3E),
            ),
          ),
        )
      ],
    );
  }
}
