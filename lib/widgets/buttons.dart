import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class buttons extends StatelessWidget {
  const buttons({
    Key? key,
    required this.name,
    required this.image,
    required this.color,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final String image;
  final int color;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 58,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(color),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/$image.png'),
              SizedBox(width: 15),
              Text(
                name,
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
    );
  }
}
