import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class subcategories extends StatefulWidget {
  const subcategories({Key? key}) : super(key: key);

  @override
  State<subcategories> createState() => _subcategoriesState();
}

class _subcategoriesState extends State<subcategories> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBF0F7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        'Samsung Galaxy',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF140F26),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/prducts_screen');
                            },
                            child: Image.asset(
                              'images/image_14.png',
                            ),
                          )),

                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
