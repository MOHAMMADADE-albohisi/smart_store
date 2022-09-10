// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/api/categories_api_controller.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/order/createprder.dart';
import 'package:smart_store/model_api/productsDetails.dart';

import '../orders/checkoute.dart';

// ignore: must_be_immutable
class Productdetails_screen extends StatefulWidget {
  Productdetails_screen({Key? key, required this.id}) : super(key: key);
  String? id;

  @override
  State<Productdetails_screen> createState() => _Productdetails_screenState();
}

class _Productdetails_screenState extends State<Productdetails_screen> {
  late PageController _homeSlider;

  @override
  void initState() {
    super.initState();
    _homeSlider = PageController(viewportFraction: 0.7, initialPage: 1);
  }

  @override
  void dispose() {
    _homeSlider.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ApiResponse<productsDetails>>(
        future: CategoreApiContloller()
            .getproductsDetiles(productsDeta: widget.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.data != null) {
            var product = snapshot.data!;
            List<CartObj> cartList = [
              CartObj(productId: product.data!.id, quantity: 1)
            ];
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
                              Navigator.pushNamed(context, '/prducts_screen');
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            AppLocalizations.of(context)!.prductdetilse,
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
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: ListView(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 150),
                          child: PageView.builder(
                              controller: _homeSlider,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (int pageIndex) {},
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: EdgeInsetsDirectional.only(
                                      end: index != 2 ? 10 : 0),
                                  color: index % 2 == 0
                                      ? Colors.grey
                                      : const Color(0xFFFFFFFF),
                                  child: Image.network(
                                    snapshot.data!.data!.imageUrl,
                                  ),
                                );
                              }),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          snapshot.data!.data!.nameAr,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF16162E),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 130.w,
                              height: 70.h,
                              child: Row(
                                children: [
                                  Text(
                                    '${snapshot.data!.data!.price}\$',
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: const Color(0xFF16162E),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 150.w,
                              height: 70.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
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
                                  Text(
                                    '2',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(
                                        0xFF16162E,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
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
                            )
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          snapshot.data!.data!.nameAr,
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: const Color(0xFF16162E),
                          ),
                        ),
                        SizedBox(height: 7.h),
                        SizedBox(
                          width: 50.w,
                          height: 90.h,
                          child: ListView(
                            children: [
                              Text(
                                snapshot.data!.data!.infoAr,
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0xFF16162E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.review,
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: const Color(0xFF16162E),
                              ),
                            ),
                            const Spacer(),
                            Image.asset('images/image_19.png')
                          ],
                        ),
                        const Divider(),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEBF0F7),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/carts_screen');
                                },
                                icon: const Icon(
                                  Icons.shopping_cart_sharp,
                                ),
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CheckoutScreen(cart: cartList),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: const Color(0xFFD5F0DB),
                              ),
                              child: Container(
                                width: 240.w,
                                height: 60.h,
                                color: const Color(0xFFD5F0DB),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.buynow,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}
