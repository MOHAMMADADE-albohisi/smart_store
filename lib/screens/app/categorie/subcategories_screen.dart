import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/api/categories_api_controller.dart';
import 'package:smart_store/model_api/DataSubCategore.dart';
import 'package:smart_store/screens/app/prducts/prducts_screen.dart';

import '../../../model_api/api_response.dart';

class subcategories extends StatefulWidget {
  subcategories({Key? key, this.id}) : super(key: key);
  String? id;

  @override
  State<subcategories> createState() => _subcategoriesState();
}

class _subcategoriesState extends State<subcategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ApiResponse<List<DataSubCategore>>>(
        future: CategoreApiContloller().getSubCategories(categoryId: widget.id!),
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
                                  itemCount: snapshot.data!.data!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    var DataSubCategore =
                                    snapshot.data!.data!.elementAt(index);
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEBF0F7),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity.w,
                                            height: 90.h,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF6AC6C5),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Image.network(
                                              snapshot
                                                  .data!.data![index].imageUrl,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 5.h),
                                            child: Text(
                                              snapshot
                                                  .data!.data![index].nameAr,
                                              style: GoogleFonts.nunitoSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.sp,
                                                  color: const Color(0xFF1D2445)),
                                            ),
                                          ),
                                          Center(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        prducts_screen(
                                                          id: DataSubCategore.id
                                                              .toString(),
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 100.w,
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blueAccent),
                                                child: Center(
                                                  child: Text(
                                                    snapshot.data!.data![index]
                                                        .nameEn,
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
