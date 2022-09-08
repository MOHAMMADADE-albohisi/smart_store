// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/api/categories_api_controller.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/login.dart';
import 'package:smart_store/model_api/products.dart';

class prducts_screen extends StatefulWidget {
  prducts_screen({Key? key, this.id}) : super(key: key);
  String? id;

  @override
  State<prducts_screen> createState() => _prducts_screenState();
}

bool _likeproduct = true;

class _prducts_screenState extends State<prducts_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PRODUCTS',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<ApiResponse<List<products>>>(
        future: CategoreApiContloller().getproducts(SubCategorieId: widget.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('prodict: ${snapshot.data}');
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.data!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        margin: EdgeInsetsDirectional.only(
                            bottom: index == 5 ? 0 : 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFEBF0F7),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/Productdetails_screen');
                                  },
                                  child: Image.network(snapshot.data!.data![index].imageUrl),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  snapshot.data!.data![index]
                                      .nameEn,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: Text(
                                    snapshot.data!.data![index].infoAr,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                     Text(snapshot.data!.data![index].price),
                                    const SizedBox(width: 9),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade400,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/carts_screen');
                                          },
                                          child: Text(
                                            'Add to cart',
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      CircleAvatar(
                                        backgroundColor:
                                            const Color(0xFFEBF0F7),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() =>
                                                {_likeproduct = !_likeproduct});
                                          },
                                          icon: Icon(
                                            color: Colors.red,
                                            _likeproduct
                                                ? Icons.favorite_border
                                                : Icons.favorite,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
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
