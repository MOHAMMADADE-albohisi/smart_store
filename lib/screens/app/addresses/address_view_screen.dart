// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

import '../../../api/GetX/addres_Getx.dart';

class view_address_screen extends StatefulWidget {
  const view_address_screen({Key? key}) : super(key: key);

  @override
  State<view_address_screen> createState() => _view_address_screenState();
}

class _view_address_screenState extends State<view_address_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<AddressGetController>(AddressGetController());
  }

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
        body: GetBuilder<AddressGetController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (controller.list.isNotEmpty) {
                var list = controller.list;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          controller.setDefaultValue(list[index]);
                        },
                        child: Container(
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
                                  SizedBox(width: 15.w),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index].name,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          list[index].info,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.sp,
                                            height: 1.0,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          list[index].contactNumber,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      AddressGetController.to
                                          .deleteAddress(index);
                                    },
                                    icon: const Icon(Icons.clear),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                );
              } else {
                return const Center(
                  child: Text("No Date"),
                );
              }
            }
          },
        ));
  }
}
