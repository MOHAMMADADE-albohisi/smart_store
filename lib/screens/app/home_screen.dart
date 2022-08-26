// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/seel_all.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  late PageController pageController;
  bool _likes = false;
  bool _likeproduct = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(viewportFraction: 0.7, initialPage: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 150),
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (int pageIndex) {},
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBF0F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsetsDirectional.only(
                              end: index != 2 ? 10 : 0),
                          child: Image.asset(
                            'images/image_12.png',
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        );
                      },
                    ),
                  ),
                  see_all(title: 'Categories', onPressed: () {}),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 180),
                    child: GridView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisCount: 1,
                              childAspectRatio: 140 / 140),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBF0F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                height: 125,
                                child: Image.asset(
                                  'images/image_20.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      'Smart Teapots',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF5882F2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                   SizedBox(height: 20.h),
                  see_all(title: 'Latest Products', onPressed: () {}),
                  SizedBox(
                    width: 50,
                    height: 350,
                    child: ListView(
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
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 120,
                                    child: Image.asset(
                                      'images/image_13.png',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          '239.96\$',
                                          style: GoogleFonts.montserrat(
                                            color: const Color(0xFF5882F2),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            setState(() => {_likes = !_likes});
                                          },
                                          icon: Icon(
                                            color: Colors.red,
                                            _likes
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Samsung Galaxy',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF140F26),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  see_all(title: 'Products you may like', onPressed: () {}),
                  SizedBox(
                    width: 50,
                    height: 200,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: GridView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisCount: 1,
                                childAspectRatio: 140 / 140),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFEBF0F7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 120,
                                  child: Image.asset(
                                    'images/image_13.png',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        '239.96\$',
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xFF5882F2),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          setState(() =>
                                              {_likeproduct = !_likeproduct});
                                        },
                                        icon: Icon(
                                          color: Colors.red,
                                          _likeproduct
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Samsung Galaxy',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF140F26),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
