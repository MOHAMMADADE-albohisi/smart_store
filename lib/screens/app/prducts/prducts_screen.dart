// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/api/categories_api_controller.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/products.dart';
import 'package:smart_store/model_api/productsDetails.dart';
import 'package:smart_store/screens/app/prducts/Product_details_screen.dart';

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
      body: FutureBuilder<ApiResponse<List<Products>>>(
        future: CategoreApiContloller().getproducts(SubCategorieId: widget.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
                      var productsDetails =
                          snapshot.data!.data!.elementAt(index);
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
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFEBF0F7),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Productdetails_screen(
                                          id: productsDetails.id.toString(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                      snapshot.data!.data![index].imageUrl),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  snapshot.data!.data![index].nameEn,
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
