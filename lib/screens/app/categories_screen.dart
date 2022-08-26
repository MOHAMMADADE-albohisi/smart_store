// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class prducts_screen extends StatefulWidget {
  const prducts_screen({Key? key}) : super(key: key);

  @override
  State<prducts_screen> createState() => _prducts_screenState();
}

class _prducts_screenState extends State<prducts_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  margin:
                      EdgeInsetsDirectional.only(bottom: index == 5 ? 0 : 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: const Color(0xFFEBF0F7),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextButton(
                            onPressed: () {

                            },
                            child: Image.asset('images/image_12.png'),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            'Marshal Bluetooth',
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
                              'They sound great, but what really sets them apart is the price.',
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
                              const Text('\$239.96'),
                              const SizedBox(width: 9),
                              SizedBox(
                                  width: 100,
                                  height: 25,
                                  child: Image.asset('images/image_19.png')),
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
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Add to cart',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.white54,
                                        ),
                                      )),
                                ),
                                const SizedBox(width: 15),
                                CircleAvatar(
                                  backgroundColor: const Color(0xFFEBF0F7),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,
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
      ),
    );
  }
}
