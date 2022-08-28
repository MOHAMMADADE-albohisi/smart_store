// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class orderdetails_screen extends StatefulWidget {
  const orderdetails_screen({Key? key}) : super(key: key);

  @override
  State<orderdetails_screen> createState() => _orderdetails_screenState();
}

class _orderdetails_screenState extends State<orderdetails_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    'Oreder ID: ',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF8B8B97),
                    ),
                  ),
                  Text(
                    '2324252627',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF16162E),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '25 Nov',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF8B8B97),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 150),
                  child: CarouselSlider(
                    options: CarouselOptions(height: 400.0),
                    items: [1, 2, 3, 4, 5].map(
                          (i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 7),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD5F0DB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'images/image_15.png',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Air Pods',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF16162E),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    height: 70,
                    child: Row(
                      children: [
                        Text(
                          '20\$',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            color: const Color(0xFF40AA54),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 150,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  )
                ],
              ),


            ],
          ),
        ));
  }
}
