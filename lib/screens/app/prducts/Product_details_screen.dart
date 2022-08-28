// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Productdetails_screen extends StatefulWidget {
  const Productdetails_screen({Key? key}) : super(key: key);

  @override
  State<Productdetails_screen> createState() => _Productdetails_screenState();
}

class _Productdetails_screenState extends State<Productdetails_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 15),
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
                        Text('30\$',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: const Color(0xFF16162E),
                            )),
                        const Spacer(),
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
              const SizedBox(height: 18),
              Text(
                'Product Details',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color(0xFF16162E),
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                width: 50,
                height: 100,
                child: ListView(
                  children: [
                    Text(
                      'AirPods are wireless headphones made by Apple marketed as of December 19, 2016.',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xFF16162E),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Review',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xFF16162E),
                    ),
                  ),
                  const Spacer(),
                  Image.asset('images/image_19.png')
                ],
              ),
              const Divider(),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF0F7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_sharp,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/card_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: const Color(0xFFD5F0DB),
                    ),
                    child: Container(
                      width: 280,
                      height: 60,
                      color: const Color(0xFFD5F0DB),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
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
        ));
  }
}
