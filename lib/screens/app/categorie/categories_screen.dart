// ignore_for_file: camel_case_types
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/api/categories_api_controller.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/login.dart';
import 'package:smart_store/model_api/CategoryApi.dart';
import 'package:smart_store/screens/app/categorie/subcategories_screen.dart';

class categories_screen extends StatefulWidget {
  const categories_screen({Key? key}) : super(key: key);

  @override
  State<categories_screen> createState() => _categories_screenState();
}

class _categories_screenState extends State<categories_screen> {
  late bool _likeproduct = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ApiResponse<List<CategoryApi>>>(
        future: CategoreApiContloller().getCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.data!.isNotEmpty) {
            return Column(
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
                            AppLocalizations.of(context)!.category,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: ListView(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            var category =
                                snapshot.data!.data!.elementAt(index);
                            return Container(
                              height: 114.h,
                              margin: EdgeInsetsDirectional.only(
                                  bottom: index == 5 ? 0 : 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.black38,
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 12.h),
                                    child: Container(
                                      width: 100.w,
                                      height: 90.h,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.network(category.imageUrl),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.nameAr,
                                          style: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: const Color(0xFF43538D),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              child: Container(
                                                width: 32.w,
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        Colors.grey.shade100),
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() => {
                                                          _likeproduct =
                                                              !_likeproduct
                                                        });
                                                  },
                                                  icon: Icon(
                                                    color: Colors.red,
                                                    _likeproduct
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 9.w),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        subcategories(
                                                      id: category.id
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 100.w,
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blueAccent),
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .viewsupcategory,
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
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
              ],
            );
          } else {
            return Container(
                child: Column(
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
                Center(
                  child: Text(
                    'NO DATA',
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ));
          }
        },
      ),
    );
  }
}
