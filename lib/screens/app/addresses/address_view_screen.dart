import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class view_address_screen extends StatefulWidget {
  const view_address_screen({Key? key}) : super(key: key);

  @override
  State<view_address_screen> createState() => _view_address_screenState();
}

class _view_address_screenState extends State<view_address_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        actions: [
          IconButton(
            onPressed: () {
            Navigator.pushNamed(context, '/addresses_screen');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      body:Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount:5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 90,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    padding:
                    EdgeInsetsDirectional.only(start: 15.w, end: 5.w),
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
                    child: Stack(
                      children: [

                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kylie',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'California Street, Blok 4F No.9',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                      height: 1.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '0214-0000-0000',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
          ),
          // Container(
          //   padding:
          //   EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          //   color: Colors.grey.shade200,
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Text(
          //             'Total:',
          //             style: GoogleFonts.cairo(
          //                 fontSize: 15.sp, fontWeight: FontWeight.bold),
          //           ),
          //           const Spacer(),
          //           Text(
          //             value.total.toString(),
          //             style: GoogleFonts.cairo(
          //                 fontSize: 15.sp, fontWeight: FontWeight.bold),
          //           )
          //         ],
          //       ),
          //       SizedBox(height: 10.h),
          //       Row(
          //         children: [
          //           Text(
          //             'quantity:',
          //             style: GoogleFonts.cairo(
          //                 fontSize: 15.sp, fontWeight: FontWeight.bold),
          //           ),
          //           const Spacer(),
          //           Text(
          //             value.quantity.toString(),
          //             style: GoogleFonts.cairo(
          //                 fontSize: 15.sp, fontWeight: FontWeight.bold),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      )
    );
  }
}
