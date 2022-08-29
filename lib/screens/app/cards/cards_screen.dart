import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class carts_screen extends StatefulWidget {
  const carts_screen({Key? key}) : super(key: key);

  @override
  State<carts_screen> createState() => _carts_screenState();
}

class _carts_screenState extends State<carts_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                    height: 110,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    padding: EdgeInsetsDirectional.only(start: 15.w, end: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.black54,
                            blurRadius: 4,
                          )
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFEBF0F7),
                          ),
                          child: Image.asset('images/image_15.png'),
                        ),
                        SizedBox(width: 33),
                        Column(
                          children: [
                            Text(
                              'AirPods',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF16162E),
                              ),
                            ),
                            SizedBox(height: 27),
                            Container(
                              width: 115,
                              height: 34,
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFD5F0DB),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          //
                                        },
                                        child: const Center(
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '2',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(
                                        0xFF16162E,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFD5F0DB),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          //
                                        },
                                        child: const Center(
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outline,
                              ),
                            ),
                            SizedBox(height: 28),
                            Text(
                              '20\$',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF16162E),
                              ),
                            ),
                          ],
                        )
                      ],
                    ));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Total Item:',
                      style: GoogleFonts.cairo(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '5',
                      style: GoogleFonts.cairo(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      'Total:',
                      style: GoogleFonts.cairo(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '100\$',
                      style: GoogleFonts.cairo(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
