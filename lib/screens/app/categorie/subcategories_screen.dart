import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class subcategories extends StatefulWidget {
  const subcategories({Key? key}) : super(key: key);

  @override
  State<subcategories> createState() => _subcategoriesState();
}

class _subcategoriesState extends State<subcategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 375.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: const Color(0xFF96E5D1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/bottomed_screen');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      AppLocalizations.of(context)!.viewsupcategory,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.h,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity.w,
                                      height: 90.h,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF6AC6C5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        'images/image_16.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,vertical: 5.h),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .supcategoryname,
                                        style: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.sp,
                                            color: Color(0xFF1D2445)),
                                      ),
                                    ),
                                    Center(
                                      child:
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/prducts_screen');
                                        },
                                        child: Container(
                                          width: 100.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: Colors.blueAccent),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .products,
                                              style: GoogleFonts.nunitoSans(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
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
